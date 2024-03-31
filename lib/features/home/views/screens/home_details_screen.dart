import 'package:Mawthoq/core/config/app_consts.dart';
import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/cart/views/components/add_to_cart_dialog.dart';
import 'package:Mawthoq/features/home/views/bloc/home_details/home_details_cubit.dart';
import 'package:Mawthoq/features/home/views/components/home_details_loading.dart';
import 'package:Mawthoq/features/home/views/components/location.dart';
import 'package:Mawthoq/features/home/views/components/property_overview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/views/widgets/custom_error_widget.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/amenities.dart';
import '../components/details_card.dart';
import '../components/details_header_component.dart';
import '../components/details_image_slider.dart';
import '../components/financials.dart';
import '../components/funding_timeline.dart';
import '../components/home_investor_calculator.dart';
import '../components/property_details.dart';
import '../components/title_card.dart';

class HomeDetailsScreen extends StatefulWidget {
  int propertyId;

  HomeDetailsScreen({super.key, required this.propertyId});

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  void setupSystemNavigationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void disposeSystemNavigationBar() {
    AppTheme.initSystemNavAndStatusBar();
  }

  @override
  void initState() {
    context.read<HomeDetailsCubit>().getOnProperty(widget.propertyId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('uniqueKey2'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          // Call your function here when the widget is not visible
          disposeSystemNavigationBar();
        } else {
          setupSystemNavigationBar();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<HomeDetailsCubit, HomeDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeDetailsIsLoading) {
                return const HomeDetailsLoading();
              } else if (state is HomeDetailsError) {
                return Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Center(
                    child: CustomErrorWidget(
                      errorMessage:
                          HomeDetailsError.failure.message ?? "Unknown",
                      onTap: () => context
                          .read<HomeDetailsCubit>()
                          .getOnProperty(widget.propertyId),
                    ),
                  ),
                );
              } else if (state is HomeDetailsSuccess) {
                return Column(
                  children: [
                    DetailsImageSlider(
                      imageUrls: HomeDetailsSuccess.propertyEntity?.images
                              ?.map((e) => AppConsts.imageUrl + e.toString())
                              .toList() ??
                          [],
                    ),
                    Space(
                      height: 2.h,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      children: [
                        TitleCard(
                            title:
                                HomeDetailsSuccess.propertyEntity?.name ?? "--",
                            bedrooms: HomeDetailsSuccess
                                    .propertyEntity?.bedsCount
                                    ?.toString() ??
                                "--",
                            bathrooms: HomeDetailsSuccess
                                    .propertyEntity?.bathroomsCount
                                    ?.toString() ??
                                "--",
                            area: HomeDetailsSuccess.propertyEntity?.area
                                    ?.toString() ??
                                "--"),
                        Space(
                          height: 2.h,
                        ),
                        DetailsHeaderComponent(
                            price: HomeDetailsSuccess.propertyEntity?.price
                                    ?.toDouble() ??
                                0,
                            raisedFunds:
                                (HomeDetailsSuccess.propertyEntity?.price ??
                                        0.0) *
                                    ((double.tryParse(HomeDetailsSuccess
                                                    .propertyEntity
                                                    ?.percentageSold ??
                                                '') ??
                                            0.0) /
                                        100),
                            investors: HomeDetailsSuccess
                                    .propertyEntity?.investorsCount ??
                                0),
                        Space(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 86.w,
                          height: 6.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: MainButton(
                                  color: AppTheme.primary900,
                                  width: 86.w,
                                  height: 6.h,
                                  label: Text(
                                    LocaleKeys.invest,
                                    style: AppTheme.mainTextStyle(
                                        color: AppTheme.secondary900,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600),
                                  ).tr(),
                                  //onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
                                ),
                              ),
                              Space(
                                width: 2.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: MainButton(
                                  color: AppTheme.secondary900,
                                  width: 86.w,
                                  height: 6.h,
                                  label: SvgPicture.asset(
                                    AppImages.cart,
                                    height: 3.h,
                                    width: 3.h,
                                    color: AppTheme.neutral100,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddToCartDialog(
                                          label: HomeDetailsSuccess
                                                  .propertyEntity?.name ??
                                              '--',
                                          image: HomeDetailsSuccess
                                                  .propertyEntity?.image ??
                                              '--',
                                          propertyId: HomeDetailsSuccess
                                                  .propertyEntity?.id
                                                  ?.toInt() ??
                                              -1,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Space(
                          height: 2.h,
                        ),
                        DetailsCard(
                            fundedData: HomeDetailsSuccess
                                    .propertyEntity?.fundingDate ??
                                "",
                            price: HomeDetailsSuccess.propertyEntity?.price
                                    ?.toDouble() ??
                                0,
                            rentalIncome: double.tryParse(HomeDetailsSuccess
                                        .propertyEntity?.annualNetRentIncome ??
                                    "") ??
                                0.0),
                        Space(
                          height: 1.5.h,
                        ),
                        Divider(
                          color: AppTheme.neutral200,
                          thickness: .2.w,
                        ),
                        PropertyDetails(
                          location: HomeDetailsSuccess
                                  .propertyEntity?.locationDescription ??
                              "--",
                          locationDescription: HomeDetailsSuccess
                                  .propertyEntity?.locationDescription ??
                              "--",
                          isRented:
                              (HomeDetailsSuccess.propertyEntity?.isRented == 1)
                                  ? true
                                  : false,
                          isProtected:
                              (HomeDetailsSuccess.propertyEntity?.isProtected ==
                                      1)
                                  ? true
                                  : false,
                          rentPerMonth: HomeDetailsSuccess
                                  .propertyEntity?.monthlyCurrentRent
                                  ?.toDouble() ??
                              0,
                          expectedGrowth: double.tryParse(HomeDetailsSuccess
                                      .propertyEntity?.annualExpectedGrowth ??
                                  '') ??
                              0,
                        ),
                        Space(
                          height: 2.h,
                        ),
                        Divider(
                          color: AppTheme.neutral200,
                          thickness: .2.w,
                        ),
                        Space(
                          height: 3.h,
                        ),
                        HomeInvestorCalculator(),
                        Space(
                          height: 5.h,
                        ),
                        PropertyOverview(
                          overview: HomeDetailsSuccess
                                  .propertyEntity?.propertyDescription ??
                              "--",
                        ),
                        Space(
                          height: 5.h,
                        ),
                        Financials(
                          price: HomeDetailsSuccess.propertyEntity?.price
                                  ?.toDouble() ??
                              0,
                          seamlessFees: double.tryParse(HomeDetailsSuccess
                                      .propertyEntity?.seamlessFee ??
                                  '') ??
                              0,
                          annualGrossRent: ((double.tryParse(HomeDetailsSuccess
                                                  .propertyEntity
                                                  ?.annualRentIncome ??
                                              '') ??
                                          0) /
                                      100)
                                  .toDouble() *
                              (HomeDetailsSuccess.propertyEntity?.price
                                      ?.toDouble() ??
                                  0),
                          serviceCharges: ((double.tryParse(HomeDetailsSuccess
                                                  .propertyEntity
                                                  ?.servicesFees ??
                                              '') ??
                                          0) /
                                      100)
                                  .toDouble() *
                              (HomeDetailsSuccess.propertyEntity?.price
                                      ?.toDouble() ??
                                  0),
                          maintenance: ((double.tryParse(HomeDetailsSuccess
                                                  .propertyEntity
                                                  ?.maintainceFees ??
                                              '') ??
                                          0) /
                                      100)
                                  .toDouble() *
                              (HomeDetailsSuccess.propertyEntity?.price
                                      ?.toDouble() ??
                                  0),
                        ),
                        Space(
                          height: 5.h,
                        ),
                        FundingTimeline(),
                        Space(
                          height: 5.h,
                        ),
                        Location(
                          location: HomeDetailsSuccess
                                  .propertyEntity?.locationDescription ??
                              "--",
                        ),
                        Space(
                          height: 5.h,
                        ),
                        Amenities(
                            hasBalacony:
                                (HomeDetailsSuccess.propertyEntity?.hasBalcony ==
                                        1)
                                    ? true
                                    : false,
                            hasGarden: (HomeDetailsSuccess.propertyEntity?.hasGarden ==
                                    1)
                                ? true
                                : false,
                            hasGym:
                                (HomeDetailsSuccess
                                            .propertyEntity?.hasGym ==
                                        1)
                                    ? true
                                    : false,
                            hasParking:
                                (HomeDetailsSuccess
                                            .propertyEntity?.hasParking ==
                                        1)
                                    ? true
                                    : false,
                            hasPool: (HomeDetailsSuccess
                                        .propertyEntity?.hasPool ==
                                    1)
                                ? true
                                : false,
                            hasRestarrant: (HomeDetailsSuccess
                                        .propertyEntity?.hasRestaurant ==
                                    1)
                                ? true
                                : false,
                            hasSupermarket: (HomeDetailsSuccess
                                        .propertyEntity?.hasSupermarket ==
                                    1)
                                ? true
                                : false),
                        Space(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ],
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

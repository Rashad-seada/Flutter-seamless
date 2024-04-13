import 'package:Mawthoq/core/config/app_consts.dart';
import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/features/cart/views/bloc/cart/cart_cubit.dart';
import 'package:Mawthoq/features/cart/views/components/cart_pay_now_card.dart';
import 'package:Mawthoq/features/main/views/main_screen.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_widget.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../components/cart_app_bar.dart';
import '../components/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [
          Space(
            height: 2.h,
          ),
          ListenableBuilder(
              listenable: context.read<CartCubit>().cartItemsCount,
              builder: (context, widget) {
                return CartAppBar();
              }),
          Space(
            height: 3.h,
          ),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CartIsLoading) {
                return CustomProgressIndicator();

              } else if (state is CartError) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: CustomErrorWidget(
                    errorMessage: CartError.failure.message ?? "Unknown",
                    onTap: () => context.read<CartCubit>().getCart(),
                  ),
                );
              } else if (state is CartSuccess &&
                  (CartSuccess.getCartResponse?.data?.isNotEmpty ?? false)) {
                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItem(
                            label: CartSuccess.getCartResponse?.data?[index]
                                    .property?.name ??
                                '',
                            imageUrl: AppConsts.imageUrl +
                                (CartSuccess.getCartResponse?.data?[index].property?.image ??
                                    ''),
                            monthlyRent:
                                (double.tryParse(CartSuccess.getCartResponse?.data?[index].property?.annualRentIncome ?? "") ?? 0) /
                                    100 *
                                    (double.tryParse(CartSuccess.getCartResponse?.data?[index].amount ?? '') ??
                                        0),
                            capitalGrowth: (double.tryParse(CartSuccess
                                            .getCartResponse
                                            ?.data?[index]
                                            .property
                                            ?.annualExpectedGrowth ??
                                        "") ??
                                    0) /
                                100 *
                                (double.tryParse(CartSuccess.getCartResponse?.data?[index].amount ?? '') ?? 0),
                            investedValue: double.tryParse(CartSuccess.getCartResponse?.data?[index].amount ?? '') ?? 0,
                            onDeleteTap: ()=> context.read<CartCubit>().onDeleteCartItemTap(context,CartSuccess.getCartResponse?.data?[index].id ?? 0),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Space(
                          height: 2.h,
                        );
                      },
                      itemCount: CartSuccess.getCartResponse?.data?.length ?? 0,
                    ),

                  ],
                );
              }
              return const SizedBox();
            },
          ),


          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Space(
                          height: 2.h,
                        ),
                  MainButton(
                    color: Colors.transparent,
                    height: 5.h,
                    width: 86.w,
                    border: Border.all(color: AppTheme.neutral300),
                    label: Text(
                      LocaleKeys.add_real_state,
                      style: AppTheme.mainTextStyle(
                          fontSize: 9.sp,
                          color: AppTheme.secondary900,
                          fontWeight: FontWeight.w600),
                    ).tr(),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainScreen()));
                    },
                  ),

                  Space(
                    height: 2.h,
                  ),
                  CartPayNowCard(
                    totalCartValue:
                    context.read<CartCubit>().getCartTotalAmount(),
                  ),
                  Space(
                    height: 5.h,
                  ),

                ],
              );
            },
          ),

        ],
      ),
    ));
  }
}

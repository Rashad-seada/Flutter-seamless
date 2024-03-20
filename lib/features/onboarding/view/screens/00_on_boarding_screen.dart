import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '/features/onboarding/view/bloc/on_boarding_cubit.dart';
import '/generated/locale_keys.g.dart';
import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../pages/on_boarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    context.read<OnBoardingCubit>().index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [

            SizedBox(
              child: PageView(
                controller: context.read<OnBoardingCubit>().controller,
                onPageChanged: context.read<OnBoardingCubit>().onPageChanged,
                children: [

                  OnBoardingPage(
                    image: AppImages.onBoardingImage1,
                    title: LocaleKeys.on_boarding_title_1,
                    description: LocaleKeys.on_boarding_description_1,
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage2,
                    title: LocaleKeys.on_boarding_title_2,
                    description: LocaleKeys.on_boarding_description_2,
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage3,
                    title: LocaleKeys.on_boarding_title_3,
                    description: LocaleKeys.on_boarding_description_3,
                  ),

                ],
              ),
            ),

            Positioned(
                bottom: 50.h,
                child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomPageIndicator(
                      index: context.read<OnBoardingCubit>().index,
                    );
                  },
                )
            ),

            Positioned(
              bottom: 14.h,
              child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return MainButton(
                    color: AppTheme.primary900,
                    width: 86.w,
                    height: 7.h,
                    label: Text(
                      LocaleKeys.next,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.secondary900, fontSize: 15.sp),
                    ).tr(),
                    onTap: ()=> context.read<OnBoardingCubit>().onNextClick(context),
                  );
                },
              ),
            ),

            Positioned(
              bottom: 7.h,
              child: GestureDetector(
                onTap: ()=> context.read<OnBoardingCubit>().onSkipCLick(context),
                child: Text(
                  LocaleKeys.skip,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral700, fontSize: 15.sp),
                ).tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

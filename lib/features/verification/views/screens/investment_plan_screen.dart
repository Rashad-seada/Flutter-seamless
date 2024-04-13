import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/verification/views/screens/your_job_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';
import '../blocs/verification_cubit.dart';
import '../components/investment_plan_card.dart';
import '../components/investment_plan_slider.dart';

class InvestmentPlanScreen extends StatelessWidget {
  void navigateToJobScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => YourJobScreen()));
  }

  InvestmentPlanScreen({super.key});

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
          CustomAppBar(label: ""),
          Space(
            height: 3.h,
          ),
          Text(
            LocaleKeys.investment_plan,
            style: AppTheme.mainTextStyle(
                fontSize: 18.sp,
                color: AppTheme.secondary900,
                fontWeight: FontWeight.w600),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.investment_plan_sub_text,
            style: AppTheme.mainTextStyle(
              fontSize: 11.sp,
              color: AppTheme.neutral400,
            ),
          ).tr(),
          Space(
            height: 3.h,
          ),
          InvestmentPlanSlider(),
          Space(
            height: 3.h,
          ),
          InvestmentPlanCard(),
          Space(
            height: 3.h,
          ),

          BlocConsumer<VerificationCubit,VerificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MainButton(
                color: AppTheme.primary900,
                width: 86.w,
                height: 6.h,
                label: (state is VerificationIsLoading)? CustomProgressIndicator(
                  color: AppTheme.neutral100,
                ) : Text(
                  LocaleKeys.next,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900, fontSize: 12.sp),
                ).tr(),
                onTap: ()=> context.read<VerificationCubit>().step2(context),
              );
            },
          ),

        ],
      ),
    ));
  }
}

import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../investor_profile/views/utils/custom_track.dart';
import '../blocs/verification_cubit.dart';

class InvestmentPlanSlider extends StatelessWidget {
  const InvestmentPlanSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              context.read<VerificationCubit>().investmentPlan.toString(),
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
            ).tr(),

            Space(width: 1.w,),

            Text(
              "SAR",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600
              ),
            ).tr(),

          ],
        ),

        Space(height: 1.5.h,),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 0.0,
            ),
            trackShape: CustomTrackShape(),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
          ),
          child: Slider(
            activeColor: AppTheme.primary900,
            inactiveColor: AppTheme.tertiary900,
            value: context.read<VerificationCubit>().investmentPlan.toDouble(),
            min: 0,
            max: 100000,
            divisions: 100,
            onChanged: (value) {
              context.read<VerificationCubit>().onSliderChange(value);
            },
          ),
        ),

        Space(height: 1.h,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              "25,000",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600
              ),
            ).tr(),

            Text(
              "50,000",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600
              ),
            ).tr(),

            Text(
              "75,000",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600
              ),
            ).tr(),

          ],
        )


      ],
    );
  },
);
  }
}

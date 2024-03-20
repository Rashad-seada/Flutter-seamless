import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomStepper extends StatelessWidget {
  int count;
  int currentStep;
  double height;
  CustomStepper({super.key,required this.count,required this.currentStep,required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          count,
          (index) => Column(
            children: [

              if(index != 0)
                Container(
                width: 0.5.w,
                height: height,
                decoration: BoxDecoration(
                  color: (index == currentStep || index < currentStep ) ? AppTheme.primary900 : AppTheme.neutral300,
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: (index == currentStep ) ?  7.w : 5.w,
                height: (index == currentStep ) ?  7.w : 5.w,
                decoration: BoxDecoration(
                  color: (index == currentStep || index < currentStep) ? AppTheme.primary900 : AppTheme.neutral300,
                  shape: BoxShape.circle
                ),

                child:  (index == currentStep )? Container(
                    width: 4.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                        color:  Colors.white,
                        shape: BoxShape.circle
                    ),) : null,
              ),

            ],
          )
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class VerificationStepsCard extends StatelessWidget {
  String label;
  String step;
  void Function()? onTap;
  bool isChecked;
  VerificationStepsCard(
      {
      super.key,
      required this.label,
      required this.step, this.onTap, this.isChecked = false
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        2.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step,
                    style: AppTheme.mainTextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.neutral400,
                    ),
                  ),
                  Text(
                    label,
                    style: AppTheme.mainTextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.secondary900,
                    ),
                  ),
                ],
              ),
          CircleAvatar(
            radius: 5.w,
            backgroundColor: (isChecked)? AppTheme.success : AppTheme.neutral100,
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: (isChecked)? Icon(
                Icons.check,
                color: AppTheme.neutral100,
              ) : null,
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}

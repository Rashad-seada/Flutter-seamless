import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class LanguageItem extends StatelessWidget {

  String image;
  String label;

  Object value;
  Object groupValue;
  void Function(Object?) onChanged;

  LanguageItem({super.key,required this.label,required this.image, required this.value,required this.groupValue,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(2.w),
              child: Image.asset(
                fit: BoxFit.cover,
                height: 10.w,
                  width: 15.w,
                  image),
            ),

            Space(width: 3.w,),

            Text(
              label,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral700,
                fontSize: 12.sp,
              ),
            ),

          ],
        ),

        Radio(
            activeColor: AppTheme.secondary900,
            value: value, groupValue: groupValue, onChanged: onChanged)

      ],
    );
  }
}

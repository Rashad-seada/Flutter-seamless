import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomCircleAvatar extends StatelessWidget {
  String assetName;
  CustomCircleAvatar({super.key,required this.assetName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.w,
      backgroundColor: AppTheme.tertiary900,
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: SvgPicture.asset(
            width: 15.w,
            height: 15.w,
            assetName,
          color: AppTheme.secondary900,
        ),
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthMethodAppBar extends StatelessWidget {
  const AuthMethodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 6.h,
          color: AppTheme.secondary900,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Container(
            height: 6.h,
            width: 13.w,
            decoration: BoxDecoration(
              color: AppTheme.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.language,
                color: AppTheme.secondary900,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

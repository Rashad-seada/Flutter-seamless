import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalletButton extends StatelessWidget {
  String label;
  WalletButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onTap: () {},
      borderRadius: BorderRadius.circular(1.5.w),
      label: Text(
        label,
        style: AppTheme.mainTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

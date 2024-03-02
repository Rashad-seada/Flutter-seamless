import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class WalletTab extends StatelessWidget {
  String label;
  bool isTapped;
  Color? color;
  WalletTab(
      {super.key, required this.label, this.isTapped = false, this.color});

  @override
  Widget build(BuildContext context) {
    if (isTapped) {
      color = AppTheme.neutral300;
    } else {
      color = AppTheme.secondary900;
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(0.5.w),
        child: MainButton(
          height: 3.5.h,
          onTap: () {
            isTapped = true;
            color = AppTheme.secondary900;
            print('Tapped');
          },
          borderRadius: BorderRadius.circular(1.w),
          label: Text(
            label,
            style: TextStyle(
              color: AppTheme.neutral700,
              fontSize: 8.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          color:  Color(0xffecf1fd),

        ),
      ),
    );
  }
}

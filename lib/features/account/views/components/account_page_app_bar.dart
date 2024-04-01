import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/currency_screen.dart';

class AccountPageAppBar extends StatelessWidget {
  String label;
  AccountPageAppBar({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=> CurrencyScreen())),
          borderRadius: BorderRadius.circular(100.w),
          
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.w),
              color: AppTheme.tertiary900,
            ),
            clipBehavior: Clip.none,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: AppTheme.neutral300,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CustomNetworkImage(
                    fit: BoxFit.cover,
                    url:
                        "https://cdn.britannica.com/79/5779-004-DC479508/Flag-Saudi-Arabia.jpg",
                    width: 4.w,
                    height: 4.w,
                  ),
                ),
                Space(
                  width: 1.w,
                ),
                Text(
                  'SAR',
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:Mawthoq/features/wallet/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ProfitsContainer extends StatelessWidget {
  String label;
  String? string;

  void navigateToWalletPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const WalletPage()));
  }

  ProfitsContainer({super.key, required this.label, this.string});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToWalletPage(context),
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
          color: AppTheme.primary900,
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                AppImages.arrowRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

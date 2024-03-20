import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SettingsCard extends StatelessWidget {
  SettingsModel model;
  SettingsCard({
    super.key,
    required this.model,
  });

  PopupMenuItem customPopupMenuItem(object) {
    if (object is LanguageModel) {
      return PopupMenuItem<String>(
        value: object.name,
        child: Text(object.name),
      );
    } else if (object is CurrencyModel) {
      return PopupMenuItem<String>(
        value: object.tag,
        child: Text(object.tag),
      );
    }

    throw Exception('Unkown model type');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                model.leadingIcon,
                color: AppTheme.primary900,
              ),
              Space(
                width: 1.w,
              ),
              Text(
                model.leadingLabel,
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                model.trailingLabel,
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              Space(width: 1.w,),
              SvgPicture.asset(
                AppImages.arrowRight,
                height: 2.5.h,
                width: 2.5.h,
                color: AppTheme.primary900,
              )
            ],
          ),
        ],
      ),
    );
  }
}

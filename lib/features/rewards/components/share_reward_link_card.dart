import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ShareRewardLinkCard extends StatelessWidget {
  const ShareRewardLinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: AppTheme.primary900.withOpacity(0.4),
        borderRadius: BorderRadius.circular(
          3.w,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.card_giftcard_rounded),
              Space(
                width: 3.w,
              ),
              Expanded(
                child: Text(
                  LocaleKeys.Invite_friends,
                  style: AppTheme.mainTextStyle(
                    color: AppTheme.secondary900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ).tr(),
              ),
            ],
          ),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.Invite_friends_sub_text,
            style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900.withOpacity(0.6), fontSize: 10.sp),
          ).tr(),
          Space(
            height: 2.h,
          ),
          MainButton(
            onTap: () {},
            label: Text(
              LocaleKeys.Invite_friends_cta,
              style: AppTheme.mainTextStyle(
                color: Colors.white,
              ),
            ).tr(),
            height: 10.w,
          ),
        ],
      ),
    );
  }
}

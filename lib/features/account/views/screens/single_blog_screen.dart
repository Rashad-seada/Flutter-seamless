import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.blog.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.all(3.h),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    3.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'العنوان',
                      style: AppTheme.mainTextStyle(
                        color: AppTheme.secondary900,
                        fontSize: 14.sp,
                      ),
                    ).tr(),
                  ),
                  Space(
                    height: 1.h,
                  ),
                  Container(
                    color: AppTheme.tertiary900,
                    child: CustomNetworkImage(
                        height: 23.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        url:
                            "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0"),
                  ),
                  Space(
                    height: 3.h,
                  ),
                  Text(
                    'Published in Feb 25, 2024',
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900,
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                  Space(
                    height: 1.h,
                  ),
                  Text(
                    LocaleKeys.seamless_sell_property,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900,
                      fontSize: 12.sp,
                    ),
                  ).tr(),
                  Space(
                    height: 1.h,
                  ),
                  Text(
                    LocaleKeys.perfect_closing_record,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900,
                      fontSize: 12.sp,
                    ),
                  ).tr(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

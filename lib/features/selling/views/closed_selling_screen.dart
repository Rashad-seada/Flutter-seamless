import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/closed_selling_grid_item.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ClosedSellingScreen extends StatelessWidget {
  const ClosedSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(3.w),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  width: 11.w,
                  height: 11.w,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(AppImages.realState),
                ),
                Space(
                  height: 2.h,
                ),
                Text(
                  LocaleKeys.exit_window_closed,
                  style: AppTheme.mainTextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondary900,
                  ),
                ).tr(),
                Space(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: AppTheme.secondary900,
                        size: 5.5.w,
                      ),
                      Space(
                        width: 1.w,
                      ),
                      Text(
                        '6 May 2024, 23:00',
                        style: AppTheme.mainTextStyle(
                          color: AppTheme.secondary900,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Space(
                  height: 2.h,
                ),
                Text(
                  LocaleKeys.eligible_properties_listed,
                  style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400,
                    fontSize: 10.sp,
                  ),
                  textAlign: TextAlign.center,
                ).tr(),
              ],
            ),
            Space(
              height: 6.h,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.w),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.next_window,
                            style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral400,
                              fontSize: 9.sp,
                            ),
                          ).tr(),
                          Space(
                            width: 1.w,
                          ),
                          Text(
                            '6 May - 20 May, 2024',
                            style: AppTheme.mainTextStyle(
                              color: AppTheme.secondary900,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1.w),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.2,
                              blurRadius: 0.2,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 5.w,
                            ),
                            Space(
                              width: 1.w,
                            ),
                            Text(
                              LocaleKeys.remind_me,
                              style: AppTheme.mainTextStyle(
                                color: AppTheme.secondary900,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Space(
                  height: 3.w,
                ),
                GridView.count(
                  childAspectRatio: 2 / 2.25,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    ClosedSellingGridItem(
                      svgAsset: AppImages.realState,
                      heading: LocaleKeys.buy_secondary_listings.tr(),
                      ending: LocaleKeys.view_listings.tr(),
                      onTap: () {},
                    ),
                    ClosedSellingGridItem(
                      svgAsset: AppImages.realState,
                      heading: LocaleKeys.sell_your_stakes.tr(),
                      ending: LocaleKeys.my_stakes.tr(),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

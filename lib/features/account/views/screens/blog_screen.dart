import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/blog_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class BlogScreeen extends StatelessWidget {
  const BlogScreeen({super.key});

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

            CustomAppBar(label: LocaleKeys.blog.tr(),),

            Space(
              height: 3.h,
            ),

            Text(
              'Learn more about investing',
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral500,
                fontSize: 12.sp,
              ),
            ),
            Space(
              height: 1.5.h,
            ),
            GridView.count(
              childAspectRatio: 2 / 1.4,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                BlogCard(),
                BlogCard(),
                BlogCard(),
                BlogCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

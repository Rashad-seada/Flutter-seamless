import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/blog_card.dart';
import 'package:Mawthoq/features/account/views/screens/single_blog_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class BlogScreen extends StatelessWidget {
  void navigateToSingleBlogScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SingleBlogScreen()));
  }

  const BlogScreen({super.key});

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
            Text(
              LocaleKeys.learn_more_investing,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral500,
                fontSize: 12.sp,
              ),
            ).tr(),
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
                BlogCard(
                  label: LocaleKeys.how_platform_works.tr(),
                  icon: Icons.question_mark_outlined,
                  onTap: () => navigateToSingleBlogScreen(context),
                ),
                BlogCard(
                  label: LocaleKeys.how_returns_work.tr(),
                  icon: Icons.trending_up_outlined,
                ),
                BlogCard(
                  label: LocaleKeys.receive_documents.tr(),
                  icon: Icons.document_scanner_outlined,
                ),
                BlogCard(
                  label: LocaleKeys.calculate_investment_value.tr(),
                  icon: Icons.currency_exchange_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

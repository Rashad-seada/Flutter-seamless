import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/rewards/components/silver_category_card.dart';
import 'package:Mawthoq/features/rewards/components/silver_category_indicator.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SilverCategoryScreen extends StatelessWidget {
  const SilverCategoryScreen({super.key});

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
              label: LocaleKeys.silver_category.tr(),
            ),
            Space(
              height: 3.h,
            ),
            SilverCategoryIndicator(raisedFunds: 100, requestedFunds: 300),
            Space(
              height: 3.h,
            ),
            SilverCategoryCard(),
          ],
        ),
      ),
    );
  }
}

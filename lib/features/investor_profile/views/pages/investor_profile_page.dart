import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../account/views/components/account_page_app_bar.dart';
import '../components/begin_investing_card.dart';
import '../components/investor_main_card.dart';
import '../components/money_growth_card.dart';

class InvestorProfilePage extends StatelessWidget {
  const InvestorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 7.w),

      shrinkWrap: true,
      children: [

        Space(height: 2.h,),

        AccountPageAppBar(label: LocaleKeys.investor_profile.tr(),),

        Space(height: 3.h,),

        InvestorMainCard(),

        Space(height: 2.h,),

        BeginInvestingCard(),

        Space(height: 2.h,),

        MoneyGrowthCard(),

        Space(height: 6.h,),

    ],
        ),));
  }
}

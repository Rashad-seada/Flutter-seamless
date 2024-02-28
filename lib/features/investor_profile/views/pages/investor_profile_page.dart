import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../account/views/components/account_page_app_bar.dart';
import '../components/investor_main_card.dart';

class InvestorProfilePage extends StatelessWidget {
  const InvestorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView(
        shrinkWrap: true,
        children: [

          Space(height: 2.h,),

          AccountPageAppBar(label: LocaleKeys.investor_profile.tr(),),

          Space(height: 5.h,),

          InvestorMainCard(),



      ],
    ),
    ),));
  }
}

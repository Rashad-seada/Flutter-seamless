import 'package:Mawthoq/features/account/views/components/currency_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [

          Space(
            height: 2.h,
          ),

          CustomAppBar(label: LocaleKeys.currency.tr()),

          Space(
            height: 3.h,
          ),

          CurrencyItem(isSelected: true, url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/1024px-Flag_of_Saudi_Arabia.svg.png', currency: 'SAR',),
          Space(
            height: 2.h,
          ),

          CurrencyItem(isSelected: false, url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/2000px-Flag_of_Qatar.svg.png', currency: 'QAR',),


        ],
      ),
    ));
  }
}

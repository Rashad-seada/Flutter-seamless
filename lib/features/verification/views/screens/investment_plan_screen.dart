import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';

class InvestmentPlan extends StatelessWidget {
  const InvestmentPlan({super.key});

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

          CustomAppBar(label: LocaleKeys.your_address.tr()),

          Space(
            height: 5.h,
          ),



          Text(
            LocaleKeys.your_address_text,
            style: AppTheme.mainTextStyle(
              fontSize: 15.sp,
              color: AppTheme.secondary900,
            ),
          ).tr(),

          Space(
            height: 1.5.h,
          ),
          Text(
            LocaleKeys.your_address_sub_text,
            style: AppTheme.mainTextStyle(
              fontSize: 11.sp,
              color: AppTheme.neutral400,
            ),
          ).tr(),

          Space(
            height: 2.h,
          ),

          Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.w),
            margin: EdgeInsets.only(bottom: 3.h),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white),
            child: Column(
              children: [

              ],
            ),
          ),


          MainButton(
            color: AppTheme.primary900,
            width: 86.w,
            height: 6.h,
            label: Text(
              LocaleKeys.next,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900, fontSize: 12.sp),
            ).tr(),
            //onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
          ),

        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class WalletTaps extends StatelessWidget {
  int selectedIndex;
  List<String> tabs;
  void Function(int) onChange;

  WalletTaps({super.key, required this.selectedIndex, required this.tabs,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) =>
            Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: tab(isSelected : selectedIndex == index,label: tabs[index],onTap: (){
                onChange(index);
              }),
            )
        ),
      ),
    );
  }

  Widget tab({bool isSelected = false,required String label,void Function()? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(2.w),
      onTap: onTap,
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 7.5.w,vertical: .8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.w),
            color: (isSelected)? AppTheme.secondary900 :AppTheme.tertiary900,
        ),
        duration: Duration(milliseconds: 300),
        child: Text(
          label,
          style: AppTheme.mainTextStyle(
              color: (isSelected)? AppTheme.neutral100 :AppTheme.neutral900  ,
              fontSize: 8.sp),
        ),
      ),
    );
  }
}

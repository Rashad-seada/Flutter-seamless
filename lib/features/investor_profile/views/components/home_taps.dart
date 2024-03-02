import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class HomeTaps extends StatelessWidget {
  int selectedIndex;
  List<String> tabs;
  void Function(int) onChange;
  HomeTaps({super.key, required this.selectedIndex, required this.tabs,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(tabs.length, (index) =>
      tab(isSelected : selectedIndex == index,label: tabs[index],onTap: (){
        onChange(index);
        print(index);
      })
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
            borderRadius: BorderRadius.circular(2.w),
            color: (isSelected)? AppTheme.primary900 :Colors.white,
          border: Border.all(color:(isSelected)? Colors.transparent: AppTheme.secondary900)
        ),
            duration: Duration(milliseconds: 300),
            child: Text(
              label,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp),
            ),
      ),
    );
  }
}

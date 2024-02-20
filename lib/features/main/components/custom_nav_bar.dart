import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/main/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomNavBar extends StatelessWidget {

  List<PageModel> items = [];

  CustomNavBar({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      width: double.infinity,
      height: 9.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(items.length, (index) => CustomNavItem(items[index])),
      ),
    );
  }
}


Widget CustomNavItem(PageModel page,){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      SvgPicture.asset(
          width: 6.w,
          height: 6.w,
          page.icon
      ),

      Space(height: .5.h,),

      Text(
        page.title,
        style: AppTheme.mainTextStyle(
            color: AppTheme.neutral900, fontSize: 9.sp),
      ),

    ],
  );
}

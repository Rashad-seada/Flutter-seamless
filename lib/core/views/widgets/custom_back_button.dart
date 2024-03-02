import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_images.dart';
import '../../config/app_theme.dart';

class CustomBackButton extends StatelessWidget {
  String title;
  void Function()? onPressed;


  CustomBackButton({super.key,this.title = "",this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            borderRadius: BorderRadius.circular(100.w),
            onTap: () {
              if(onPressed != null){
                onPressed!();
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(2.w),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppTheme.neutral100,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(AppImages.arrow,
                width: 6.w
                ,height: 6.w,
              ),
            )
        ),

        Space(width: 5.w,),

        Text(
          title,
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral700,
            fontSize: 14.sp,
          ),
        ),



      ],
    );
  }
}

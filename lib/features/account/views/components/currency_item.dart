import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class CurrencyItem extends StatelessWidget {
  String url;
  String currency;
  bool isSelected;
  CurrencyItem({super.key,required this.url,required this.currency, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: (isSelected)? AppTheme.success.withOpacity(0.1) : AppTheme.neutral100,
        border: Border.all(color: (isSelected)? AppTheme.success : AppTheme.neutral300),
        borderRadius: BorderRadius.circular(
          2.w,
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [

              Container(
                clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: CustomNetworkImage(url: url,width: 6.w,height: 6.w,fit: BoxFit.cover,)),

              Space(width: 2.w,),

              Text(
                currency,
                style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral700,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),



            ],
          ),


          CircleAvatar(
            radius: 3.w,
            backgroundColor: (isSelected)? AppTheme.success : AppTheme.neutral100,
            child: (isSelected)? Icon(
              size: 3.w,
              Icons.check,
              color: AppTheme.neutral100,
            ) : null,
          ),



        ],
      ),

    );
  }
}

import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../generated/locale_keys.g.dart';

class CartItem extends StatelessWidget {
  String label;
  String imageUrl;
  double monthlyRent;
  double capitalGrowth;
  double investedValue;
  void Function()? onDeleteTap;

  CartItem({super.key,required this.label,required this.imageUrl,required this.monthlyRent,required this.capitalGrowth,required this.investedValue,this.onDeleteTap});

  NumberFormat formatter = NumberFormat('#,##0');


  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(3.w),
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

          SizedBox(
            height: 6.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    color: AppTheme.neutral300,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CustomNetworkImage(
                    fit: BoxFit.cover,
                    url: imageUrl,
                    width: 20.w,
                    height: 6.h,
                  ),
                ),
                Space(width: 3.w,),

                Expanded(
                  child: Text(
                    label,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral700,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                  ),
                ),

                Space(width: 3.w,),

                IconButton(onPressed: onDeleteTap, icon: Icon(Icons.delete_outline_rounded))


              ],
            ),
          ),

          Space(height: 1.h,),

          Row(
            children: [

              MainButton(
                color: Colors.transparent,
                height: 10.w,
                width: 10.w,
                border: Border.all(color: AppTheme.neutral200),
                label: Text(
                  "+",
                  style: AppTheme.mainTextStyle(
                    fontSize: 18.sp,
                    color: AppTheme.primary900,
                      fontWeight: FontWeight.w600

                  ),
                ).tr(),
              ),

              Space(width: 1.w,),

              Expanded(
                child: MainButton(
                  color: Colors.transparent,
                  height: 10.w,
                  border: Border.all(color: AppTheme.neutral200),
                  label: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SAR",
                        style: AppTheme.mainTextStyle(
                          fontSize: 10.sp,
                          color: AppTheme.neutral600,
                        ),
                      ).tr(),

                      Space(width: 0.6.w,),

                      Text(
                        formatter.format(investedValue),
                        style: AppTheme.mainTextStyle(
                          fontSize: 14.sp,
                          color: AppTheme.neutral900,
                          fontWeight: FontWeight.w600
                        ),
                      ).tr(),
                    ],
                  ),
                ),
              ),

              Space(width: 1.w,),

              MainButton(
                color: Colors.transparent,
                height: 10.w,
                width: 10.w,
                border: Border.all(color: AppTheme.neutral200),
                label: Text(
                  "-",
                  style: AppTheme.mainTextStyle(
                    fontSize: 18.sp,
                    color: AppTheme.primary900,
                    fontWeight: FontWeight.w600
                  ),
                ).tr(),
              )

            ],
          ),

          Space(height: 2.h,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.monthly_rent,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400,
                    fontSize: 11.sp,
                ),
              ).tr(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SAR",
                    style: AppTheme.mainTextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.neutral600,
                    ),
                  ).tr(),

                  Space(width: 0.6.w,),

                  Text(
                    formatter.format(monthlyRent),
                    style: AppTheme.mainTextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.neutral900,
                        fontWeight: FontWeight.w600
                    ),
                  ).tr(),
                ],
              ),

            ],
          ),

          Space(height: 1.h,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.capital_growth,
                style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400,
                  fontSize: 11.sp,
                ),
              ).tr(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SAR",
                    style: AppTheme.mainTextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.neutral600,
                    ),
                  ).tr(),

                  Space(width: 0.6.w,),

                  Text(
                    formatter.format(capitalGrowth),
                    style: AppTheme.mainTextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.neutral900,
                        fontWeight: FontWeight.w600
                    ),
                  ).tr(),
                ],
              ),

            ],
          ),

          Space(height: 1.h,),



        ],
      ),
    );
  }
}

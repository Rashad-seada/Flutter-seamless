import 'package:Mawthoq/core/config/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../utils/amenities_model.dart';

class Amenities extends StatelessWidget {
  bool hasBalacony;
  bool hasGarden;
  bool hasGym;
  bool hasParking;
  bool hasPool;
  bool hasRestarrant;
  bool hasSupermarket;

  Amenities({super.key,required this.hasBalacony,required this.hasGarden,required this.hasGym,required this.hasParking,required this.hasPool,required this.hasRestarrant,required this.hasSupermarket,});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.amenities.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ),
          ],
        ),

        Space(
          height: 3.h,
        ),

        Wrap(
          direction: Axis.horizontal,
          spacing: 5.w, // horizontal space between the children
          runSpacing: 8.0.w, // v
           children: [

             if(hasBalacony)
               amenities(AmenitiesModel(name: LocaleKeys.balcony.tr(), image: AppImages.balcony)),

             if(hasGarden)
               amenities(AmenitiesModel(name: LocaleKeys.garden.tr(), image: AppImages.garden)),

             if(hasGym)
               amenities(AmenitiesModel(name: LocaleKeys.gym.tr(), image: AppImages.gym)),

             if(hasParking)
               amenities(AmenitiesModel(name: LocaleKeys.parking.tr(), image: AppImages.parking)),

             if(hasPool)
               amenities(AmenitiesModel(name: LocaleKeys.pool.tr(), image: AppImages.pool)),

             if(hasRestarrant)
               amenities(AmenitiesModel(name: LocaleKeys.restaurant.tr(), image: AppImages.restaurant)),

             if(hasSupermarket)
               amenities(AmenitiesModel(name: LocaleKeys.supermarket.tr(), image: AppImages.supermarket)),

           ],
        )


      ],
    );
  }

  Widget amenities(AmenitiesModel amenitiesModel){
    return SizedBox(
      height: 8.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: AppTheme.tertiary900),
              child: Image.asset(amenitiesModel.image,width: 7.w,height: 7.w,)),

          Space(width: 3.w,),

          Text(
            amenitiesModel.name,
            style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.neutral600,
                fontSize: 10.sp),
          ),

        ],
      ),
    );
  }

}

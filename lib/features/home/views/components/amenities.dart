import 'package:Mawthoq/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
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
              "Amenities",
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
               amenities(AmenitiesModel(name: 'Balacony', image: AppImages.investment)),

             if(hasGarden)
               amenities(AmenitiesModel(name: 'Garden', image: AppImages.investment)),

             if(hasGym)
               amenities(AmenitiesModel(name: 'Gym', image: AppImages.investment)),

             if(hasParking)
               amenities(AmenitiesModel(name: 'Parking', image: AppImages.investment)),

             if(hasPool)
               amenities(AmenitiesModel(name: 'Pool', image: AppImages.documents)),

             if(hasRestarrant)
               amenities(AmenitiesModel(name: 'Restarrant', image: AppImages.documents)),

             if(hasSupermarket)
               amenities(AmenitiesModel(name: 'Supermarket', image: AppImages.documents)),

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

          SvgPicture.asset(amenitiesModel.image,width: 8.w,height: 8.w,),

          Space(width: 3.w,),

          Text(
            amenitiesModel.name,
            style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.neutral600,
                fontSize: 12.sp),
          ),

        ],
      ),
    );
  }

}

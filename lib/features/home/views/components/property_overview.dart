import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class PropertyOverview extends StatelessWidget {
  String overview;

  PropertyOverview({super.key,required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Property Overview",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ),
          ],
        ),
        Space(
          height: 2.2.h,
        ),
        ReadMoreText(
          overview,
          trimLines: 3,
          colorClickableText: AppTheme.secondary900,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          lessStyle: TextStyle(color :AppTheme.secondary900,fontSize: 14, fontWeight: FontWeight.bold),
          moreStyle: TextStyle(color :AppTheme.secondary900, fontSize: 14, fontWeight: FontWeight.bold),
          style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.w400,
                color: AppTheme.neutral400,
                fontSize: 10.sp),

        ),
      ],
    );
  }
}

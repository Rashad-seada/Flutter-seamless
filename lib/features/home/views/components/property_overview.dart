import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class PropertyOverview extends StatelessWidget {
  const PropertyOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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

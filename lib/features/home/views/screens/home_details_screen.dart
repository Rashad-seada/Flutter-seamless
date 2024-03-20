import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/home/views/components/location.dart';
import 'package:Mawthoq/features/home/views/components/property_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../components/amenities.dart';
import '../components/details_card.dart';
import '../components/details_header_component.dart';
import '../components/details_image_slider.dart';
import '../components/financials.dart';
import '../components/funding_timeline.dart';
import '../components/home_card.dart';
import '../components/home_investor_calculator.dart';
import '../components/property_details.dart';
import '../components/title_card.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});


  void setupSystemNavigationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void disposeSystemNavigationBar() {
    AppTheme.initSystemNavAndStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('uniqueKey2'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          // Call your function here when the widget is not visible
          disposeSystemNavigationBar();
        }else {
          setupSystemNavigationBar();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            DetailsImageSlider(
              imageUrls: [
                "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0",
                "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0",
                "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0",
                "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0"
              ],
            ),
            Space(height: 2.h,),

            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              children: [

                TitleCard(),

                Space(height: 2.h,),

                DetailsHeaderComponent(),

                Space(height: 2.h,),

                DetailsCard(),



                Space(
                  height: 1.5.h,
                ),

                Divider(
                  color: AppTheme.neutral200,
                  thickness: .2.w,
                ),


                PropertyDetails(),

                Space(
                  height: 2.h,
                ),

                Divider(
                  color: AppTheme.neutral200,
                  thickness: .2.w,
                ),

                Space(
                  height: 3.h,
                ),

                HomeInvestorCalculator(),

                Space(
                  height: 5.h,
                ),

                PropertyOverview(),

                Space(
                  height: 5.h,
                ),

                Financials(),

                Space(
                  height: 5.h,
                ),

                FundingTimeline(),

                Space(
                  height: 5.h,
                ),

                Location(),

                Space(
                  height: 5.h,
                ),

                Amenities(),


                Space(
                  height: 4.h,
                ),

                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [

                    HomeCard(),

                    HomeCard(),

                    HomeCard(),


                  ],
                ),

              ],
            ),
          ],
                ),
        ),),
    );
  }
}

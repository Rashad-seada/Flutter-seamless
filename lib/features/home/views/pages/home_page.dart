import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/custom_tab.dart';
import '../components/home_app_bar.dart';
import '../components/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [

          HomeAppBar(),

          Space(height: 2.h,),

          CustomTab(

            tabsLabels: [
            "first",
            "second",
            "third",

          ],
            pages: [

              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    shrinkWrap: true,
                    children: [

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),


                    ],
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),


                    ],
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),

                      HomeCard(),


                    ],
                  ),
                ),
              )

            ],

          ),

          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 7.w),
          //   child: ListView(
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     children: [
          //
          //       HomeCard(),
          //
          //       HomeCard(),
          //
          //       HomeCard(),
          //
          //       HomeCard(),
          //
          //
          //     ],
          //   ),
          // )

        ],
      ),
    ));
  }
}

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
      body: ListView(
        shrinkWrap: true,
        children: [

          HomeAppBar(),

          Space(height: 2.h,),


          Padding(
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
          )

        ],
      ),
    ));
  }
}

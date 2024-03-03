import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/custom_tab.dart';
import '../../../investor_profile/views/components/home_taps.dart';
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

          Space(height: 2.5.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: BlocConsumer<HomeCubit,HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return HomeTaps(
                  tabs: context.read<HomeCubit>().tabs,
                  selectedIndex: context.read<HomeCubit>().selectedIndex,
                  onChange: context.read<HomeCubit>().onTabChange,
                );
              },
            ),
          ),

          Space(height: 2.5.h,),

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

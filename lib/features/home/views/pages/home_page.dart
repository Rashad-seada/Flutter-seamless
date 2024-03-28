import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/core/views/widgets/custom_error_widget.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../investor_profile/views/components/home_taps.dart';
import '../../../verification/views/components/account_verification_card.dart';
import '../components/home_app_bar.dart';
import '../components/home_card.dart';
import '../components/home_card_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    context.read<HomeCubit>().getAllProperties();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          HomeAppBar(
            onNotificationTap: ()=>  context.read<HomeCubit>().onNotificationTap(context),
            onCartTap: ()=> context.read<HomeCubit>().onCartTap(context),
            onFavoriteTap: ()=> context.read<HomeCubit>().onFavoriteTap(context),
          ),

          Space(height: 2.5.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: AccountVerificationCard(),
          ),

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

          BlocConsumer<HomeCubit,HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(state is HomeIsLoading){

                return ListView(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    HomeCardLoading(),
                    HomeCardLoading(),
                    HomeCardLoading(),
                    HomeCardLoading(),
                  ],
                );

              }else if(state is HomeError){

                return CustomErrorWidget(
                  errorMessage: HomeError.failure?.message ?? "Unknown",
                  onTap: ()=> context.read<HomeCubit>().getAllProperties() ,
                );

              }else if(state is HomeSuccess){
                return ListView.builder(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomeSuccess.properties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeCard(propertyEntity: HomeSuccess.properties[index],);
                  },
                );
              }

              return SizedBox();

            },
          )

        ],
      ),
    ));
  }
}

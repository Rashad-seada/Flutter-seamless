import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/favourites/views/blocs/favorites_cubit.dart';
import 'package:Mawthoq/features/favourites/views/components/empty_favorites_component.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/views/widgets/custom_error_widget.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../home/views/components/home_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  @override
  void initState() {
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              children: [
                Space(
                  height: 2.h,
                ),
                CustomAppBar(
                  label: LocaleKeys.favourites.tr(),
                ),
                Space(
                  height: 3.h,
                ),

                BlocBuilder<FavoritesCubit,FavoritesState>(
                  builder: (context, state) {

                    if(state is FavoritesIsLoading){
                      return CustomProgressIndicator();

                    } else if(state is FavoritesError){
                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CustomErrorWidget(
                          errorMessage: FavoritesError.failure.message ?? "Unknown",
                          onTap: () => context.read<FavoritesCubit>().getFavorites(),
                        ),
                      );

                    } else if(state is FavoritesSuccess){

                      if(FavoritesSuccess.getFavoriteResponse?.data?.isEmpty ?? true){
                        return EmptyFavoritesComponents();

                      } else {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: FavoritesSuccess.getFavoriteResponse?.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeCard(propertyEntity: FavoritesSuccess.getFavoriteResponse!.data![index].property!,);
                          },
                        );
                      }
                    }

                    return SizedBox();

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

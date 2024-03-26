import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/features/cart/views/screens/cart_screen.dart';
import 'package:Mawthoq/features/home/domain/usecases/get_all_properties_use_case.dart';
import 'package:Mawthoq/features/home/views/screens/home_details_screen.dart';
import 'package:Mawthoq/features/notifications/views/screen/notifications_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/entities/property_entity.dart';
import '../../../data/utils/property_status.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int selectedIndex = 0;

  List<String> get tabs => ["Available","Funded","Sold out"];

  String propertyStatus = PropertyStatus.available;

  getAllProperties(){
    emit(HomeIsLoading());
    getIt<GetAllPropertiesUseCase>().call(status: propertyStatus, page: 1).then(
      (value) => value.fold(
        (error) {
          emit(HomeError(error));

        },
        (success) {
          emit(HomeSuccess(success.data?.data ?? [] ));

        }
      )
    );
  }


  onTabChange(int index){
    emit(HomeTabChange());
    switch (index) {
      case 0:
        propertyStatus = PropertyStatus.available;
        break;
      case 1:
        propertyStatus = PropertyStatus.funded;
        break;
      case 2:
        propertyStatus = PropertyStatus.soldOut;
        break;
    }
    selectedIndex = index;
    emit(HomeInitial());
    getAllProperties();
  }

  onCartTap(BuildContext context) {
    _navigateToCartScreen(context);
  }

  onFavoriteTap(BuildContext context) {

  }

  onNotificationTap(BuildContext context) {
    _navigateToNotificationScreen(context);
  }

  onHomeCardClick(BuildContext context,int propertyId){
    _navigateToHomeDetailsScreen(context,propertyId);
  }

  _navigateToCartScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> CartScreen()));
  }

  _navigateToHomeDetailsScreen(BuildContext context,int propertyId){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeDetailsScreen(propertyId: propertyId)));
  }


  _navigateToNotificationScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> NotificationsScreen()));
  }


}

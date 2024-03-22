import 'package:Mawthoq/features/cart/views/screens/cart_screen.dart';
import 'package:Mawthoq/features/home/views/screens/home_details_screen.dart';
import 'package:Mawthoq/features/notifications/views/screen/notifications_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int selectedIndex = 0;

  List<String> tabs = ["المموله","المتوفره","المباعه"];


  onTabChange(int index){
    emit(HomeTabChange());
    selectedIndex = index;
    emit(HomeInitial());
  }

  onCartTap(BuildContext context) {
    _navigateToCartScreen(context);
  }

  onFavoriteTap(BuildContext context) {

  }

  onNotificationTap(BuildContext context) {
    _navigateToNotificationScreen(context);
  }

  onHomeCardClick(BuildContext context){
    _navigateToHomeDetailsScreen(context);
  }

  _navigateToCartScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> CartScreen()));
  }

  _navigateToHomeDetailsScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeDetailsScreen()));
  }


  _navigateToNotificationScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> NotificationsScreen()));
  }


}

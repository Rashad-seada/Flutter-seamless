import 'package:bloc/bloc.dart';
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

}

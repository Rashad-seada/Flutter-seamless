import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  int selectedIndex = 0;


  onTabChange(int index){
    emit(WalletPageChanged());
    selectedIndex = index;
    emit(WalletInitial());
  }

}

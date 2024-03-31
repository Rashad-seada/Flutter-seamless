import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/home/data/entities/property_entity.dart';
import 'package:Mawthoq/features/home/domain/usecases/get_one_property_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../../../generated/locale_keys.g.dart';

part 'home_details_state.dart';

class HomeDetailsCubit extends Cubit<HomeDetailsState> {
  HomeDetailsCubit() : super(HomeDetailsInitial());

  List<String> get tabs => [LocaleKeys.acquisition.tr(), LocaleKeys.rental_income.tr()];

  int selectedIndex = 0;

  onTabChange(
    int index,
  ) {
    emit(HomeDetailsPageChanges());
    selectedIndex = index;
    emit(HomeDetailsSuccess(HomeDetailsSuccess.propertyEntity));
  }

  getOnProperty(int propertyId) {
    emit(HomeDetailsIsLoading());
    getIt<GetOnePropertyUseCase>()
        .call(propertyId: propertyId)
        .then((value) => value.fold((error) {
              emit(HomeDetailsError(error));
            }, (success) {
              emit(HomeDetailsSuccess(success.data));
            }));
  }
}

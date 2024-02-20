import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/main/utils/pages.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../home/views/pages/home_page.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  PageModel currentPage(){
    return pages[index];
  }

  List<PageModel> pages = [
    PageModel(LocaleKeys.real_state.tr(), AppImages.realState, HomePage()),
    PageModel(LocaleKeys.wallet.tr(), AppImages.wallet, HomePage()),
    PageModel(LocaleKeys.documents.tr(), AppImages.documents, HomePage()),
    PageModel(LocaleKeys.rewards.tr(), AppImages.reward, HomePage()),
    PageModel(LocaleKeys.account.tr(), AppImages.account, HomePage()),

  ];


}

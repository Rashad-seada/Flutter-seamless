import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/views/pages/account_page.dart';
import 'package:Mawthoq/features/main/utils/pages.dart';
import 'package:Mawthoq/features/rewards/pages/rewards_page.dart';
import 'package:Mawthoq/features/wallet/pages/wallet_page.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../home/views/pages/home_page.dart';
import '../../../investor_profile/views/pages/investor_profile_page.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  Widget currentPage() {
    return pages[index].page;
  }

  List<PageModel> get pages => [
    PageModel(LocaleKeys.real_state.tr(), AppImages.realState, HomePage()),
    PageModel(LocaleKeys.wallet.tr(), AppImages.wallet, WalletPage()),
    PageModel(LocaleKeys.documents.tr(), AppImages.documents, InvestorProfilePage()),
    PageModel(LocaleKeys.rewards.tr(), AppImages.reward, RewardsPage()),
    PageModel(LocaleKeys.account.tr(), AppImages.account, AccountPage()),
  ];

  onNavItemTap(index) {
    emit(MainPageChanged());
    this.index = index;
    emit(MainInitial());
  }
}

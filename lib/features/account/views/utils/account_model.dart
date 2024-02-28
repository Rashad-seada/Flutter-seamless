class AccountContainerModel {
  String? icon;
  String label;
  void Function() onTap;
  AccountContainerModel(this.icon, this.label, this.onTap);
}

class SettingsModel<T> {
  String leadingIcon;
  String leadingLabel;
  String trailingLabel;
  void Function() onTap;
  List<T> object;
  SettingsModel(this.leadingIcon, this.leadingLabel, this.trailingLabel,
      this.onTap, this.object);
}

class LanguageModel {
  String name;
  void Function() onTap;

  LanguageModel(this.name, this.onTap);
}

class CurrencyModel {
  String name;
  String tag;
  void Function() onTap;

  CurrencyModel(this.name, this.tag, this.onTap);
}

class SettingsCardModel {
  String settingIcon;
  String settingLabel;
  bool isEnabled;
  SettingsCardModel(this.settingIcon, this.settingLabel, this.isEnabled);
}

class SettingsMenuModel {
  String menuLabel1;
  String menuLabel2;
  SettingsMenuModel(this.menuLabel1, this.menuLabel2);
}

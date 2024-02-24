class AccountContainerModel {
  String? icon;
  String label;
  void Function() onTap;
  AccountContainerModel(this.icon, this.label, this.onTap);
}

class SettingsContainerModel {
  String settingIcon;
  String settingLabel1;
  String settingLabel2;
  void Function() onTap;
  SettingsContainerModel(
      this.settingIcon, this.settingLabel1, this.settingLabel2, this.onTap);
}

class SettingsCardModel {
  String settingIcon;
  String settingLabel;
  bool isEnabled;
  SettingsCardModel(this.settingIcon, this.settingLabel, this.isEnabled);
}

class SettingModel {
  int? settingsId;
  String? settingsTitle;
  String? settingSubTitle;
  String? textImageLink;

  SettingModel({
    this.settingsId,
    this.settingsTitle,
    this.settingSubTitle,
    this.textImageLink,
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitle = json['settings_title'];
    settingSubTitle = json['setting_sub_title'];
    textImageLink = json['text_image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_title'] = this.settingsTitle;
    data['setting_sub_title'] = this.settingSubTitle;
    data['text_image_link'] = this.textImageLink;
    return data;
  }
}

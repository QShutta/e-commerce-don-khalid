class SettingModel {
  int? settingsId;

  String? settingsTitle; // Arabic title
  String? settingTitleEn; // English title

  String? settingSubTitle; // Arabic subtitle
  String? settingSubtitleEn; // English subtitle

  String? textImageLink;

  SettingModel({
    this.settingsId,
    this.settingsTitle,
    this.settingTitleEn,
    this.settingSubTitle,
    this.settingSubtitleEn,
    this.textImageLink,
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];

    settingsTitle = json['settings_title'];
    settingTitleEn = json['setting_title_en'];

    settingSubTitle = json['setting_sub_title'];
    settingSubtitleEn = json['setting_subtitle_en'];

    textImageLink = json['text_image_link'];
  }

  Map<String, dynamic> toJson() {
    return {
      'settings_id': settingsId,
      'settings_title': settingsTitle,
      'setting_title_en': settingTitleEn,
      'setting_sub_title': settingSubTitle,
      'setting_subtitle_en': settingSubtitleEn,
      'text_image_link': textImageLink,
    };
  }
}

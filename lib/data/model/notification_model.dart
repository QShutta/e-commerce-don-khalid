class NotificationModel {
  int? notficationId;

  String? notficationTitle;
  String? notficationTitleAr;

  String? notficationBody;
  String? notficationBodyAr;

  int? notficationUserId;
  String? dateOfCreate;

  NotificationModel({
    this.notficationId,
    this.notficationTitle,
    this.notficationTitleAr,
    this.notficationBody,
    this.notficationBodyAr,
    this.notficationUserId,
    this.dateOfCreate,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notficationId = json['notfication_id'];

    notficationTitle = json['notfication_title'];
    notficationTitleAr = json['notfication_title_ar'];

    notficationBody = json['notfication_body'];
    notficationBodyAr = json['notfication_body_ar'];

    notficationUserId = json['notfication_user_id'];
    dateOfCreate = json['date_of_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['notfication_id'] = notficationId;

    data['notfication_title'] = notficationTitle;
    data['notfication_title_ar'] = notficationTitleAr;

    data['notfication_body'] = notficationBody;
    data['notfication_body_ar'] = notficationBodyAr;

    data['notfication_user_id'] = notficationUserId;
    data['date_of_create'] = dateOfCreate;

    return data;
  }
}

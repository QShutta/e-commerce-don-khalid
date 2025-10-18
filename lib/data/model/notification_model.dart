class NotificationModel {
  int? notficationId;
  String? notficationTitle;
  String? notficationBody;
  int? notficationUserId;
String? dateOfCreate;

  NotificationModel(
      {this.notficationId,
      this.notficationTitle,
      this.notficationBody,
      this.notficationUserId,
    this.dateOfCreate,
      });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notficationId = json['notfication_id'];
    notficationTitle = json['notfication_title'];
    notficationBody = json['notfication_body'];
    notficationUserId = json['notfication_user_id'];
    
    dateOfCreate = json['date_of_create']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notfication_id'] = notficationId;
    data['notfication_title'] = notficationTitle;
    data['notfication_body'] = notficationBody;
    data['notfication_user_id'] = notficationUserId;
    data['date_of_create']=dateOfCreate;
    return data;
  }
}
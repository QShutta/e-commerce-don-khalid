class Catogeries {
  int? catogeriesId;
  String? catogeriesNameAr;
  String? catogeriesNameEn;
  String? catogeriesImage;
  String? catogeriesDateOfCreate;

  Catogeries({
    this.catogeriesId,
    this.catogeriesNameAr,
    this.catogeriesNameEn,
    this.catogeriesImage,
    this.catogeriesDateOfCreate,
  });

  Catogeries.fromJson(Map<String, dynamic> json) {
    catogeriesId = json['catogeries_id'];
    catogeriesNameAr = json['catogeries_name_ar'];
    catogeriesNameEn = json['catogeries_name_en'];
    catogeriesImage = json['catogeries_image'];
    catogeriesDateOfCreate = json['catogeries_date_of_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catogeries_id'] = this.catogeriesId;
    data['catogeries_name_ar'] = this.catogeriesNameAr;
    data['catogeries_name_en'] = this.catogeriesNameEn;
    data['catogeries_image'] = this.catogeriesImage;
    data['catogeries_date_of_create'] = this.catogeriesDateOfCreate;
    return data;
  }
}

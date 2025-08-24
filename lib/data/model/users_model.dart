class UsersModel {
  int? userId;
  String? userName;
  String? userEmail;
  int? userVarfyCode;
  int? userApprove;
  String? userCreatedAt;
  String? userPassword;
  String? userImageUrl;

  UsersModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userVarfyCode,
    this.userApprove,
    this.userCreatedAt,
    this.userPassword,
    this.userImageUrl,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userVarfyCode = json['user_varfy_code'];
    userApprove = json['user_approve'];
    userCreatedAt = json['user_created_at'];
    userPassword = json['user_password'];
    userImageUrl = json['user_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_varfy_code'] = userVarfyCode;
    data['user_approve'] = userApprove;
    data['user_created_at'] = userCreatedAt;
    data['user_password'] = userPassword;
    data['user_image_url'] = userImageUrl;
    return data;
  }
}

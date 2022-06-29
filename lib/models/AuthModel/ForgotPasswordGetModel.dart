class ForgotPasswordGetModel {
  Data? data;
  String? status;
  String? message;

  ForgotPasswordGetModel({this.data, this.status, this.message});

  ForgotPasswordGetModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? otpId;
  String? otp;

  Data({this.otpId, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    otpId = json['otp_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp_id'] = this.otpId;
    data['otp'] = this.otp;
    return data;
  }
}

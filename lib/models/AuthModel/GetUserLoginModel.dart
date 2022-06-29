class GetUserLoginModel {
  UserData? userData;
  String? status;
  String? message;

  GetUserLoginModel({this.userData, this.status, this.message});

  GetUserLoginModel.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int? ownerId;
  String? name;
  String? email;
  String? profilePhoto;
  String? address;
  String? gender;
  String? age;
  String? pincode;

  UserData(
      {this.ownerId,
        this.name,
        this.email,
        this.profilePhoto,
        this.address,
        this.gender,
        this.age,
        this.pincode});

  UserData.fromJson(Map<String, dynamic> json) {
    ownerId = json['owner_id'];
    name = json['name'];
    email = json['email'];
    profilePhoto = json['profile_photo'];
    address = json['address'];
    gender = json['gender'];
    age = json['age'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_photo'] = this.profilePhoto;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['pincode'] = this.pincode;
    return data;
  }
}

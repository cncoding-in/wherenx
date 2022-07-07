class MenuMediaGetModel {
  List<DataBusiness>? dataBusiness;
  String? status;
  String? message;

  MenuMediaGetModel({this.dataBusiness, this.status, this.message});

  MenuMediaGetModel.fromJson(Map<String, dynamic> json) {
    if (json['data_business'] != null) {
      dataBusiness = <DataBusiness>[];
      json['data_business'].forEach((v) {
        dataBusiness!.add(new DataBusiness.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataBusiness != null) {
      data['data_business'] =
          this.dataBusiness!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class DataBusiness {
  int? imageId;
  String? imageUrl;

  DataBusiness({this.imageId, this.imageUrl});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_id'] = this.imageId;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class GetBusinessListModel {
  List<DataBusiness>? dataBusiness;
  String? status;
  String? message;

  GetBusinessListModel({this.dataBusiness, this.status, this.message});

  GetBusinessListModel.fromJson(Map<String, dynamic> json) {
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
  int? businessId;
  String? businessName;
  String? logo;
  String? status;
  String? address;
  String? description;

  DataBusiness(
      {this.businessId,
        this.businessName,
        this.logo,
        this.status,
        this.address,
        this.description});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    businessId = json['business_id'];
    businessName = json['business_name'];
    logo = json['logo'];
    status = json['status'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}

class BusinessListModel2{
  late List<GetBusinessListModel> _Business;
  List<GetBusinessListModel> get Business => _Business;
  BusinessListModel2.fromJson(List<dynamic> json) {
    if(json != null){
      _Business = <GetBusinessListModel>[];

      json.forEach((element) {
        print(element);
        // var json1 = jsonDecode(element.toString());
        _Business.add(GetBusinessListModel.fromJson(element));
      });
    }

  }
}

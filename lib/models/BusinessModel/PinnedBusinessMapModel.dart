class PinnedBusinessMapModel {
  List<BusinessData>? businessData;
  String? status;
  String? message;

   late List<PinnedBusinessMapModel> _pinnedBusiness;
   List<PinnedBusinessMapModel> get pinnedBusiness => _pinnedBusiness;

  PinnedBusinessMapModel({this.businessData, this.status, this.message});

  PinnedBusinessMapModel.fromJson(Map<String, dynamic> json) {

    _pinnedBusiness = <PinnedBusinessMapModel>[];

    if (json['business_data'] != null) {
      businessData = <BusinessData>[];
      json['business_data'].forEach((v) {
        businessData!.add(new BusinessData.fromJson(v));
        _pinnedBusiness.add(PinnedBusinessMapModel.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businessData != null) {
      data['business_data'] =
          this.businessData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }


}

class BusinessData {
  String? id;
  String? name;
  String? latLng;
  String? propertyImage;
  String? pinnedBy;

  BusinessData(
      {this.id, this.name, this.latLng, this.propertyImage, this.pinnedBy});

  BusinessData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latLng = json['LatLng'];
    propertyImage = json['property_image'];
    pinnedBy = json['pinned_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['LatLng'] = this.latLng;
    data['property_image'] = this.propertyImage;
    data['pinned_by'] = this.pinnedBy;
    return data;
  }
}
// class PinnedBusinessMapModel2{
//   late List<PinnedBusinessMapModel> _pinnedBusiness;
//   List<PinnedBusinessMapModel> get pinnedBusiness => _pinnedBusiness;
//   PinnedBusinessMapModel2.fromJson(List<dynamic> json) {
//     if(json != null){
//       _pinnedBusiness = <PinnedBusinessMapModel>[];
//
//       json.forEach((element) {
//         print(element);
//         // var json1 = jsonDecode(element.toString());
//         _pinnedBusiness.add(PinnedBusinessMapModel.fromJson(element));
//       });
//     }
//
//   }
// }

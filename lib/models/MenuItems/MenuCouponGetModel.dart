class MenuCouponModel {
  List<OfferData>? offerData;
  String? status;
  String? message;

  MenuCouponModel({this.offerData, this.status, this.message});

  MenuCouponModel.fromJson(Map<String, dynamic> json) {
    if (json['offer_data'] != null) {
      offerData = <OfferData>[];
      json['offer_data'].forEach((v) {
        offerData!.add(new OfferData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offerData != null) {
      data['offer_data'] = this.offerData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class OfferData {
  int? couponId;
  String? couponCode;
  String? offerType;
  String? rate;
  String? status;
  String? startDate;
  String? endDate;

  OfferData(
      {this.couponId,
        this.couponCode,
        this.offerType,
        this.rate,
        this.status,
        this.startDate,
        this.endDate});

  OfferData.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    offerType = json['offer_type'];
    rate = json['rate'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_code'] = this.couponCode;
    data['offer_type'] = this.offerType;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

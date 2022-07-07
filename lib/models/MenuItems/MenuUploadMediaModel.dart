class MenuUploadMediaModel {
  MediaData? mediaData;
  String? status;
  String? message;

  MenuUploadMediaModel({this.mediaData, this.status, this.message});

  MenuUploadMediaModel.fromJson(Map<String, dynamic> json) {
    mediaData = json['media_data'] != null
        ? new MediaData.fromJson(json['media_data'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediaData != null) {
      data['media_data'] = this.mediaData!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class MediaData {
  String? imageUrl;
  int? imageId;

  MediaData({this.imageUrl, this.imageId});

  MediaData.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['image_id'] = this.imageId;
    return data;
  }
}

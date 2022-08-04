class MapMarkerPinnedModel {

  String location,key_word;



  MapMarkerPinnedModel({
    // required this.radius,
    required this.location,
    required this.key_word,

  });


  Map<String, dynamic> toJson(){
    final Map<String,String> data = new Map<String,String>();
    data["location"] = this.location;
    data["key_word"] = this.key_word;
    return data;

  }
}
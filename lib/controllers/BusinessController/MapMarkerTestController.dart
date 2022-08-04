import 'package:businesspartner/models/LatlongListForDemoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../helper/repository/LatlongListForDemoRepo.dart';

import '../../models/LatlongListForDemoModel.dart';

class MapMarkerTestController extends GetxController{

  late  LatlongListForDemoRepo latlongListForDemoRepo;
  MapMarkerTestController({required this.latlongListForDemoRepo});

    List<BusinessData> _latLongList=[];
    List<BusinessData> get latLongList => _latLongList;

  // Future<void> getLatlongListFormDemoController(BuildContext context)async {
  //   Response response = await latlongListForDemoRepo.getPinnedBusinessMapResult() ;
  //   if(response.statusCode==200){
  //     final data = LatlongListForDemoModel.fromJson(response.body);
  //     _latLongList=[];
  //
  //     update();
  //     print("_____ from controller _____");
  //     print(response.body.toString());
  //
  //
  //     if (data.status == "success") {
  //       print("success ");
  //     } else {
  //       print("not success ");
  //     }
  //   } else {
  //     print("something went wrong");
  //   }
  // }


}



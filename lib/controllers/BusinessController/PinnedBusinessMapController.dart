import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helper/repository/LatlongListForDemoRepo.dart';
import '../../helper/repository/PinnedBusinessMapRepo.dart';
import '../../models/BusinessModel/PinnedBusinessMapModel.dart';

class PinnedBusinessMapController extends GetxController{
  PinnedBusinessMapModel? pinnedBusinessMapModel;
  late final PinnedBusinessMapRepo getPinnedBusinessMapRepo;
  PinnedBusinessMapController({required this.getPinnedBusinessMapRepo});

  var markerList = <PinnedBusinessMapModel>[].obs;

  get getPinnedBusinessMap => null;

  @override
  void onInit(){
    super.onInit();
    getPinnedBusinessMapResult();
  }


  Future<PinnedBusinessMapModel?> getPinnedBusinessMapResult()async {
    Response response = await getPinnedBusinessMapRepo.getPinnedBusinessMapRepo() ;
    if(response.statusCode==200){
      print(response.body.toString());

      var response1 = PinnedBusinessMapModel.fromJson(response.body);

      PinnedBusinessMapModel _pinnedBusinessMapModel = PinnedBusinessMapModel.fromJson(response.body);
      markerList.add(_pinnedBusinessMapModel);
      print("_____ from controller markerList _____");
      print(markerList.value);
      final getPinnedBusinessMap = PinnedBusinessMapModel.fromJson(response.body);
      print("_____ from controller getPinnedBusinessMap _____");
      print(getPinnedBusinessMap);
      print(getPinnedBusinessMap.status);
      print(getPinnedBusinessMap.message);
      print(getPinnedBusinessMap.runtimeType);
      pinnedBusinessMapModel = (getPinnedBusinessMap) as PinnedBusinessMapModel;
      for(int i = 0 ; i<pinnedBusinessMapModel!.businessData!.length;i++){
        print("_____ from controller_____");
        print(getPinnedBusinessMap.runtimeType);
        print(pinnedBusinessMapModel.runtimeType);
        print(pinnedBusinessMapModel!.businessData![i].latLng);
      }

      if(getPinnedBusinessMap.status=="success"){

       // return PinnedBusinessMapModel.fromJson(response1);
        var map = jsonDecode(response.body);
        return map;
        print("success YYYYYY ");

      }else{

        print("not success XXXXXX");

      }

    } else{
      print("something went wrong");
    }


    return null ;
  }

  //  postTheFunction() {
  //    for(int i = 0 ; i<pinnedBusinessMapModel!.businessData!.length;i++){
  //      print("_____ from controller_____");
  //      print(pinnedBusinessMapModel!.businessData![i].latLng);
  //    }
  //   return pinnedBusinessMapModel?.businessData;
  //
  // }



}
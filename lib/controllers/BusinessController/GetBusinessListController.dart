import 'package:businesspartner/helper/constants.dart';
import 'package:businesspartner/helper/repository/GetBusinessListRepo.dart';
import 'package:businesspartner/models/BusinessModel/GetBusinessListModel.dart';
import 'package:businesspartner/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetBusinessListController extends GetxController{
  final GetBusinessListRepo getBusinessListRepo;
  GetBusinessListController({required this.getBusinessListRepo});

  late var getBusinessListModel = new GetBusinessListModel();


  int length  =0;


  Future<void> getBusinessListGetResult()async {
    Response response = await getBusinessListRepo.getBusinessListFromRepo() ;
    if(response.statusCode==200){
      print(response.body.toString());
     getBusinessListModel  = GetBusinessListModel.fromJson(response.body);
     length =  (getBusinessListModel.dataBusiness?.length==null? 0
          : getBusinessListModel.dataBusiness?.length)!;
      update();
      print(getBusinessListModel.status);
      print(getBusinessListModel.dataBusiness);
      print(getBusinessListModel.message);
      print(getBusinessListModel.dataBusiness?.length);
      if(getBusinessListModel.status=="success"){
        Fluttertoast.showToast(
            msg: "Business list refrshed !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        Fluttertoast.showToast(
            msg: "No record found !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } else{

    }


  }

  void getEditBusinessResult(int index) {
    Constants.MENU_BUSINESS_INDEX = index.toString();
    Constants.MENU_BUSINESS_ID = getBusinessListModel.dataBusiness![index].businessId.toString();
    Constants.PROPERTY_NAME = getBusinessListModel.dataBusiness![index].businessName.toString();
    Get.toNamed(RouteHelper.getAllMenu());
  }


}
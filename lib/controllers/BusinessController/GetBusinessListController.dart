import 'dart:convert';

import 'package:businesspartner/helper/constants.dart';
import 'package:businesspartner/helper/repository/GetBusinessListRepo.dart';
import 'package:businesspartner/models/BusinessModel/GetBusinessListModel.dart';
import 'package:businesspartner/pages/Helper/Loading.dart';
import 'package:businesspartner/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../pages/Helper/Loading.dart';

class GetBusinessListController extends GetxController{
  final GetBusinessListRepo getBusinessListRepo;
  GetBusinessListController({required this.getBusinessListRepo});

  late var getBusinessListModel = new GetBusinessListModel();


  int length  =0;

  Loading loading = Loading();

  Future<void> getBusinessListGetResult()async {
    Response response = await getBusinessListRepo.getBusinessListFromRepo() ;
    if(response.statusCode==200){
      print(response.body.toString());
     getBusinessListModel  = GetBusinessListModel.fromJson(response.body);
     length =  (getBusinessListModel.dataBusiness?.length==null? 0
          : getBusinessListModel.dataBusiness?.length)!;
      update();

      if(getBusinessListModel.status=="success"){

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

  Future<void> getDeleteBusinessResult(int index)async {

    loading.showLoading(title: "Deleting your business...");
    Response response = await getBusinessListRepo.getDeleteBusinessFromRepo(getBusinessListModel.dataBusiness![index].businessId.toString()) ;
    if(response.statusCode==200){

      if(parseJson(response.body).toString()=="success"){
        getBusinessListGetResult() ;
        Fluttertoast.showToast(
            msg: "Business deleted successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        loading.hideLoading();
        Get.back();

      }else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: parseJson(response.body).toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.offNamed(RouteHelper.getDashboardPage());
      }

    } else{
     // loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops filed, try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();

    }


  }


  Future<void> getStatusChangeBusinessResult(int index, String status)async {

    loading.showLoading(title: "Changing your status...");
    Response response = await getBusinessListRepo.getStatusChangeBusinessFromRepo(getBusinessListModel.dataBusiness![index].businessId.toString(),status ) ;

    if(response.statusCode==200){

      if(parseJson(response.body).toString()=="success"){
        getBusinessListGetResult() ;
        Fluttertoast.showToast(
            msg: "Status changed successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        loading.hideLoading();
        Get.back();

      }else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: parseJson(response.body).toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.offNamed(RouteHelper.getDashboardPage());
      }

    } else{
      // loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops filed, try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();

    }


  }

  parseJson(Map<String, dynamic> json) {
    return json['status'];
  }

}
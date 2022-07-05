
import 'dart:io';


import 'package:businesspartner/helper/repository/MenuBusinessRepo.dart';
import 'package:businesspartner/models/BusinessModel/CreateBusinessModel.dart';
import 'package:businesspartner/models/MenuItems/GetMenuBusinessDetailsModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/route_helper.dart';

class MenuBusinessController extends GetxController{
  final MenuBusinessrepo menuBusinessrepo ;
  MenuBusinessController({required this.menuBusinessrepo});
  var isPhotoSelected='false'.obs;
  var selectedImagePath=''.obs;
  var selectedImageSize=''.obs;

  var cropImagePath=''.obs;
  var cropImageSize=''.obs;

  var compressImagePath=''.obs;
  var compressImageSize=''.obs;

  String? propertyType='';
  String? propertyName='';
  String? brief='';
  String? photoPath='';
  late var createBusinessModel = new CreateBusinessModel();
  late var menuDeatilsModel = new GetMenuBusinessDetailsModel();

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource,imageQuality: 50);
    if(pickedFile != null){

      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";


      // Compress

      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          selectedImagePath.value,
          targetPath, quality: 50);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
      print(compressImageSize.value);


      print(selectedImageSize.value);
      print(cropImageSize.value);
      print(compressImagePath.value);

      isPhotoSelected.value="true";

      // ApiClient(appBaseUrl: '').postData1(compressImagePath.value);
      //postDataWithFile1(selectedImagePath.value);

    } else {

      Fluttertoast.showToast(
          msg: "No image selected !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> getMenuBusinessDetailsResult()async {
    Response response = await menuBusinessrepo.getMenuDetailsResultFromRepo() ;


    if(response.statusCode==200){
      createBusinessModel  = CreateBusinessModel.fromJson(response.body);
      print(response.body.toString());
      propertyName =  createBusinessModel.dataBusiness?.propertyName;
      propertyType =  createBusinessModel.dataBusiness?.propertyType;
      brief =  createBusinessModel.dataBusiness?.brief ;
      photoPath =  createBusinessModel.dataBusiness?.logo ;
      update();
      update();
      print(createBusinessModel.status);

      if(createBusinessModel.status=="success"){
        Fluttertoast.showToast(
            msg: "Data fetched successfully!",
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

  Future<void> getBusinessDetailsPostResultData(String type, String name,String brief1 )async {
    Response response = await menuBusinessrepo.getBusinessDetailsUpdateFormRepo(type,name,brief1,compressImagePath.value) ;
    if(response.statusCode==200){
      print(response.body.toString());
      menuDeatilsModel = GetMenuBusinessDetailsModel.fromJson(response.body);

      if(menuDeatilsModel.status=="success"){
        propertyName =  createBusinessModel.dataBusiness?.propertyName;
        propertyType =  createBusinessModel.dataBusiness?.propertyType;
        brief =  createBusinessModel.dataBusiness?.brief ;
        photoPath =  createBusinessModel.dataBusiness?.logo ;
        update();
        Fluttertoast.showToast(
            msg: "Business create successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.offNamed(RouteHelper.getDashboardPage());
      }
      else{
        Fluttertoast.showToast(
            msg: createBusinessModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } else{
      Fluttertoast.showToast(
          msg: "Oops failed!, try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }



}
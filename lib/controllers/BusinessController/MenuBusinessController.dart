
import 'dart:io';


import 'package:businesspartner/helper/repository/MenuBusinessRepo.dart';
import 'package:businesspartner/models/BusinessModel/CreateBusinessModel.dart';

import 'package:businesspartner/models/MenuItems/MenuAddressModel.dart';
import 'package:businesspartner/models/MenuItems/MenuCouponGetModel.dart';
import 'package:businesspartner/models/MenuItems/MenuDetailsModel.dart';
import 'package:businesspartner/models/MenuItems/MenuLocationModel.dart';
import 'package:businesspartner/models/MenuItems/MenuMediaGetModel.dart';
import 'package:businesspartner/models/MenuItems/MenuOfferModel.dart';
import 'package:businesspartner/models/MenuItems/MenuUploadMediaModel.dart';
import 'package:businesspartner/pages/Helper/Loading.dart';
import 'package:businesspartner/pages/MenuItems/BusinessDetails.dart';

import 'package:flutter/material.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../helper/constants.dart';
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

  // for location
  String? latValue='null';
  String? lngValue='null';

  // coupon

  int length  =0;

  // media

  int mediaLength  =0;

  // Offer

  int offerLength  =0;

  late var createBusinessModel =  CreateBusinessModel();
  late var menuLocationModel =  MenuLocationModel();
  late var menuCouponModel =  MenuCouponModel();
  late var menuAddressModel =  MenuAddressModel();
  late var menuMediaGetModel =  MenuMediaGetModel();
  late var menuUploadMediaModel =  MenuUploadMediaModel();

  late var menuOfferModel =  MenuOfferModel();

  Loading loading =  Loading();
  parseJson(Map<String, dynamic> json) {
    return json['status'];
  }

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
      isPhotoSelected.value="true";
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
    loading.showLoading(title: "Please wait...");
    Response response = await menuBusinessrepo.getMenuDetailsResultFromRepo() ;

    if(response.statusCode==200){
      MenuDetailsModel menuDetailsModel  = MenuDetailsModel.fromJson(response.body);
      print(response.body.toString());
      propertyName =  menuDetailsModel.dataBusiness?.businessName;
      propertyType =  menuDetailsModel.dataBusiness?.businessType;
      brief =  menuDetailsModel.dataBusiness?.description ;
      photoPath =  menuDetailsModel.dataBusiness?.logo ;

      if(menuDetailsModel.status=="success"){
        loading.hideLoading();
        Get.to(BusinessDetails());
      }else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: menuDetailsModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } else{
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops failed, try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getBusinessDetailsPostResultData(String type, String name,String brief1 )async {
    loading.showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getBusinessDetailsUpdateFormRepo(type,name,brief1,compressImagePath.value) ;
    if(response.statusCode==200){
      print(response.body.toString());
      MenuDetailsModel menuDetailsModel  = MenuDetailsModel.fromJson(response.body);

      if(menuDetailsModel.status=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Details Updated successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }
      else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: menuDetailsModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } else{
      loading.hideLoading();
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


    // for location

    Future<void> getMenuLocationDetails()async {
      loading..showLoading(title: "Please wait...");

      Response response = await menuBusinessrepo.getMenuLocationResultFromRepo() ;


      if(response.statusCode==200){
        menuLocationModel  = MenuLocationModel.fromJson(response.body);
        print(response.body.toString());


        if(menuLocationModel.status=="success"){
          latValue =  menuLocationModel.dataBusiness?.latitude ?? "null";
          lngValue =  menuLocationModel.dataBusiness?.longitude ?? "null";
        }
      print(latValue.toString()+lngValue.toString());
        loading.hideLoading();
        Get.toNamed(RouteHelper.getNewLocationPage());

      } else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Oohps, failed.. Try again !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }


    }

  Future<void> getMenuLocationPostDetails(getLatitude, getLongitude)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuLocationPostResultFromRepo(getLatitude, getLongitude) ;


    if(response.statusCode==200){
      menuLocationModel  = MenuLocationModel.fromJson(response.body);
      print(response.body.toString());

      if(menuLocationModel.status=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Location updated successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }


    } else{
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }


  // for coupon

  Future<void> getMenuCouponDetails(bool frommenu)async {
    loading..showLoading(title: "Please wait...");
    print(Constants.OWNERID_DATA);
    Response response = await menuBusinessrepo.getMenuCouponResultFromRepo() ;


    if(response.statusCode==200){

      menuCouponModel  = MenuCouponModel.fromJson(response.body);
      length =  (menuCouponModel.offerData?.length==null? 0
          : menuCouponModel.offerData?.length)!;
      update();
      print(response.body.toString());
      if(menuLocationModel.status=="success"){



      }

      loading.hideLoading();
      frommenu==true?Get.toNamed(RouteHelper.getCouponsPage()):"";

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }


  Future<void> getMenuAddCouponResult(String dropdownValue, String discountType, String couponCode, String startDateAndTime, String endDateAndTime)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuAddCouponResultFromRepo(dropdownValue,discountType,couponCode,startDateAndTime,endDateAndTime) ;


    if(response.statusCode==200){


      print(response.body.toString());
      if(menuLocationModel.status=="success"){


      }
      getMenuCouponDetails(false);

      loading.hideLoading();
      Get.back();
     // Get.toNamed(RouteHelper.getAllMenu());

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getMenuCouponDeleteDetails()async {
    loading..showLoading(title: "Deleting coupon...");

    Response response = await menuBusinessrepo.getMenuCouponDeleteResultFromRepo() ;

    print(response.body);
    if(response.statusCode==200){
      if(parseJson(response.body)=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Deleted successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      } else {
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Failed !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }
    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getStatusChangeCouponResult(int index, String status)async {

    loading.showLoading(title: "Changing your status...");
    Response response = await menuBusinessrepo.getStatusChangeCouponFromRepo(menuCouponModel.offerData![index].couponId.toString(),status ) ;

    if(response.statusCode==200){

      if(parseJson(response.body).toString()=="success"){
        getMenuCouponDetails(false) ;
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
       // Get.back();

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
       // Get.back();
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
     // Get.back();

    }


  }


  // for Address

  Future<void> getMenuADDRESSDetails()async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuAddressResultFromRepo() ;

    print(response.body.toString());
    if(response.statusCode==200){

      menuAddressModel  = MenuAddressModel.fromJson(response.body);

      print(response.body.toString());
      if(menuAddressModel.status=="success"){
        Constants.ASTATE =menuAddressModel.dataBusiness!.state.toString();
        Constants.ACITY =menuAddressModel.dataBusiness!.city.toString();
        Constants.ACOUNTRY =menuAddressModel.dataBusiness!.country.toString();
        Constants.AADDRESS =menuAddressModel.dataBusiness!.address.toString();
        Constants.APINCODE =menuAddressModel.dataBusiness!.state.toString();
      }

      loading.hideLoading();
      Get.toNamed(RouteHelper.getAddressPage());

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }


  Future<void> getMenuAddAddressResult(String state, String city, String country, String address, String pincode,)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuAddAddressResultFromRepo(state,city,country,address,pincode) ;
    print(response.body.toString());

    if(response.statusCode==200){

      menuAddressModel  = MenuAddressModel.fromJson(response.body);

      print(menuAddressModel.dataBusiness?.state);
      if(menuAddressModel.status=="success"){
        Constants.ASTATE =menuAddressModel.dataBusiness!.state.toString();
        Constants.ACITY =menuAddressModel.dataBusiness!.city.toString();
        Constants.ACOUNTRY =menuAddressModel.dataBusiness!.country.toString();
        Constants.AADDRESS =menuAddressModel.dataBusiness!.address.toString();
        Constants.APINCODE =menuAddressModel.dataBusiness!.state.toString();
      }

      loading.hideLoading();
     // Get.toNamed(RouteHelper.getAllMenu());
      Get.back();

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }


  // for Media

  Future<void> getMenuMediaDetails(bool fromMenu)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuMediaResultFromRepo() ;

    print(response.body.toString());
    if(response.statusCode==200){

      menuMediaGetModel  = MenuMediaGetModel.fromJson(response.body);
      mediaLength =  (menuMediaGetModel.dataBusiness?.length==null? 0
          : menuMediaGetModel.dataBusiness?.length)!;
      print(response.body.toString());
      if(menuMediaGetModel.status=="success"){

      }

      loading.hideLoading();
      fromMenu==true?Get.toNamed(RouteHelper.getMediaPage()):Get.offNamed(RouteHelper.getMediaPage());


    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getMenuMediaDeleteDetails()async {
    loading..showLoading(title: "Deleting media...");

    Response response = await menuBusinessrepo.getMenuMediaDeleteResultFromRepo() ;

    print(response.body);
    if(response.statusCode==200){
      if(parseJson(response.body)=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Deleted successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      } else {
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Failed !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }
    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getMenuMediaUploadeDetails(String imagePath)async {
    loading..showLoading(title: "Uploading media...");

    Response response = await menuBusinessrepo.getMenuMediaUploadResultFromRepo(imagePath) ;
    menuUploadMediaModel  = MenuUploadMediaModel.fromJson(response.body);
    print(response.body);
    if(response.statusCode==200){
      if(menuUploadMediaModel.status=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Uploaded successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        getMenuMediaDetails(false);
      } else {
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Oops, failed.. Try again !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }



    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }


  // for Offer

  Future<void> getMenuOfferDetails(bool fromMenu)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuOfferResultFromRepo() ;

    print(response.body.toString());
    if(response.statusCode==200){

      menuOfferModel  = MenuOfferModel.fromJson(response.body);
      offerLength =  (menuOfferModel.offerData?.length==null? 0
          : menuOfferModel.offerData?.length)!;
      print(response.body.toString());
      if(menuOfferModel.status=="success"){

      }
      loading.hideLoading();
      fromMenu==true?Get.toNamed(RouteHelper.getOfferPage()):Get.offNamed(RouteHelper.getOfferPage());

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oops, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getMenuAddOfferResult(String dropdownValue,String discountamount, String startDateAndTime, String endDateAndTime)async {
    loading..showLoading(title: "Please wait...");

    Response response = await menuBusinessrepo.getMenuAddOfferResultFromRepo(dropdownValue,discountamount,startDateAndTime,endDateAndTime) ;


    if(response.statusCode==200){


      print(response.body.toString());
      if(menuLocationModel.status=="success"){

        getMenuOfferDetails(false);
        loading.hideLoading();
        Get.back();
      } else{
        loading.hideLoading();
        Get.back();
      }


      //Get.toNamed(RouteHelper.getAllMenu());

    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.back();
    }


  }

  Future<void> getMenuOfferDeleteDetails()async {
    loading..showLoading(title: "Deleting offer...");

    Response response = await menuBusinessrepo.getMenuOfferDeleteResultFromRepo() ;

    print(response.body);
    if(response.statusCode==200){
      if(parseJson(response.body)=="success"){
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Deleted successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      } else {
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Failed !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      }
    } else{
      print(response.body);
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps, failed.. Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  Future<void> getStatusChangeOfferResult(int index, String status)async {

    loading.showLoading(title: "Changing your status...");
    Response response = await menuBusinessrepo.getStatusChangeOfferFromRepo(menuOfferModel.offerData![index].offersId.toString(),status ) ;

    if(response.statusCode==200){

      if(parseJson(response.body).toString()=="success"){
       // getMenuOfferDetails(false) ;
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
       // Get.back();

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
       // Get.offNamed(RouteHelper.getDashboardPage());
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


}
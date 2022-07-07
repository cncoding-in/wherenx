

import 'dart:io';

import 'package:businesspartner/helper/api_client.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class MenuBusinessrepo extends GetxController implements GetxService{

  final box = GetStorage();

  final ApiClient apiClient;

  MenuBusinessrepo({ required this.apiClient});


  Future<Response> getMenuDetailsResultFromRepo() async{
    return await apiClient.getData(Constants.GETBUSINESSDETAILS+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }


  Future<Response> getBusinessDetailsUpdateFormRepo(String type, String name,String brief1,String logoPath) async{

    bool path = false;

    bool directoryExists = await Directory(logoPath).exists();
    bool fileExists = await File(logoPath).exists();
    if(directoryExists || fileExists) {
      // do stuff
      path = true;
    }
    final form = FormData({
      'owner_id':Constants.OWNERID_DATA,
      'business_id':Constants.MENU_BUSINESS_ID,
      'property_name':name,
      'property_type': type,
      'description':brief1,
      'logo': path==true?MultipartFile(logoPath, filename: 'logo.png'):"no photo",

    });
    print(form.toString());
    return await apiClient.postDataWithFile(Constants.BUSINESSDETAILSSAVE,form );
  }


  //Location

  Future<Response> getMenuLocationResultFromRepo() async{
    return await apiClient.getData(Constants.MENUBUSINESSLOCATION+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }

  Future<Response> getMenuLocationPostResultFromRepo(getLatitude, getLongitude) async{
    return await apiClient.postData(Constants.MENUBUSINESSLOCATIONPOST,toJsonForLocationPost(getLatitude, getLongitude));
  }


  // coupon

  Future<Response> getMenuCouponResultFromRepo() async{
    return await apiClient.getData(Constants.MENUCOUPONSGET+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }

  Future<Response> getMenuAddCouponResultFromRepo(String dropdownValue, String discountType, String couponCode, String startDateAndTime, String endDateAndTime) async{
    return await apiClient.postData(Constants.MENUCOUPONSPOST, toJsonForAddCouponPost(dropdownValue,discountType,couponCode,startDateAndTime,endDateAndTime));

  }


  // ADDRESS

  Future<Response> getMenuAddressResultFromRepo() async{
    return await apiClient.getData(Constants.MENUGETADDRESS+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }


  Future<Response> getMenuAddAddressResultFromRepo(String state, String city, String country, String address, String pincode) async{
    return await apiClient.postData(Constants.MENUADDADDRESS, toJsonForAddAddressPost(state,city,country,address,pincode));

  }


  // MEDIA

  Future<Response> getMenuMediaResultFromRepo() async{
    return await apiClient.getData(Constants.MENUMEDIA+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }

  Future<Response> getMenuMediaDeleteResultFromRepo() async{
    return await apiClient.deleteData(Constants.MENUDELETEMEDIA+Constants.MEDIAID);
  }


  Future<Response> getMenuMediaUploadResultFromRepo(String imagePath) async{
    bool path = false;
    bool directoryExists = await Directory(imagePath).exists();
    bool fileExists = await File(imagePath).exists();
    if(directoryExists || fileExists) {
      // do stuff
      path = true;
    }
    final form = FormData({
      'business_id':Constants.MENU_BUSINESS_ID,
      'owner_id': Constants.OWNERID_DATA,
      'image': path==true?MultipartFile(imagePath, filename: 'logo.png'):"no photo",

    });
    return await apiClient.postDataWithFile(Constants.MENUUPLOADMEDIA,form );
  }


  // OFFER

  Future<Response> getMenuOfferResultFromRepo() async{
    return await apiClient.getData(Constants.MENUOFFER+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }

  Future<Response> getMenuAddOfferResultFromRepo(String dropdownValue,String discountamount, String startDateAndTime, String endDateAndTime) async{
    return await apiClient.postData(Constants.MENUADDOFFER, toJsonForAddOfferPost(dropdownValue,discountamount,startDateAndTime,endDateAndTime));

  }

  Map<String, dynamic> toJson(email, password){
    final Map<String,String> data = new Map<String,String>();
    data["email"] = email;
    data["password"] = password;
    return data;
  }

  Map<String, dynamic> toJsonForLocationPost(getLatitude,getLongitude){
    final Map<String,String> data = new Map<String,String>();
    data["business_id"] = Constants.MENU_BUSINESS_ID;
    data["owner_id"] = Constants.OWNERID_DATA;
    data["latitude"] = getLatitude.toString();
    data["longitude"] = getLongitude.toString();
    return data;
  }

  Map<String, dynamic> toJsonForAddCouponPost(String dropdownValue, String discountType, String couponCode, String startDateAndTime, String endDateAndTime){
    final Map<String,String> data = new Map<String,String>();
    data["business_id"] = Constants.MENU_BUSINESS_ID;
    data["owner_id"] = Constants.OWNERID_DATA;
    data["coupon_code"] = couponCode;
    data["offer_type"] = dropdownValue;
    data["rate"] = discountType;
    data["start_date"] = startDateAndTime;
    data["end_date"] = endDateAndTime;
    data["status"] = "active";
    return data;
  }

  Map<String, dynamic> toJsonForAddOfferPost(String dropdownValue,String discountamount, String startDateAndTime, String endDateAndTime){
    final Map<String,String> data = new Map<String,String>();
    data["business_id"] = Constants.MENU_BUSINESS_ID;
    data["owner_id"] = Constants.OWNERID_DATA;
    data["offer_type"] = dropdownValue;
    data["rate"] = discountamount;
    data["start_date"] = startDateAndTime;
    data["end_date"] = endDateAndTime;
    data["status"] = "active";
    return data;
  }

  Map<String, dynamic> toJsonForAddAddressPost(String state, String city, String country, String address, String pincode){
    final Map<String,String> data = new Map<String,String>();
    data["business_id"] = Constants.MENU_BUSINESS_ID;
    data["owner_id"] = Constants.OWNERID_DATA;
    data["state"] = state;
    data["city"] = city;
    data["country"] = country;
    data["address"] = address;
    data["pincode"] = pincode;
    return data;
  }
}
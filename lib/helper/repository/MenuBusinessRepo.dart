

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
    return await apiClient.get(Constants.GETBUSINESSDETAILS+"owner_id="+Constants.OWNERID_DATA+"&business_id="+Constants.MENU_BUSINESS_ID);
  }


  Future<Response> getBusinessDetailsUpdateFormRepo(String type, String name,String brief1,String logoPath) async{

    bool path = false;
    print(box.read(Constants.OWNERID));
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
    return await apiClient.postDataWithFile(Constants.BUSINESSDETAILSSAVE,form );
  }





  Map<String, dynamic> toJson(email, password){
    final Map<String,String> data = new Map<String,String>();
    data["email"] = email;
    data["password"] = password;
    return data;
  }

}
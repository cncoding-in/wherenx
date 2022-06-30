

import 'dart:io';

import 'package:businesspartner/models/BusinessModel/CreateBusinessModel.dart';
import 'package:get/get.dart';

import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../api_client.dart';
import '../constants.dart';

class CreateBusinessRepo extends GetxController implements GetxService{

  final box = GetStorage();

  final ApiClient apiClient;

  CreateBusinessRepo({required this.apiClient});



  Future<Response> getCreateBusinessFormRepo(String type, String name,String brief1,String logoPath) async{

    bool path = false;
    print(box.read(Constants.OWNERID));
    bool directoryExists = await Directory(logoPath).exists();
    bool fileExists = await File(logoPath).exists();
    if(directoryExists || fileExists) {
      // do stuff
      path = true;
    }
    final form = FormData({
      'property_name':name,
      'property_type': type,
      'description':brief1,
      'owner_id': box.read(Constants.OWNERID),

      'logo': path==true?MultipartFile(logoPath, filename: 'logo.png'):"no photo",

    });
    return await apiClient.postDataWithFile(Constants.CREATEBUSINESS,form );
  }



}
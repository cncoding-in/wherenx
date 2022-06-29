

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



  Future<Response> getCreateBusinessFormRepo(CreateBusinessModel createBusinessModel,String logoPath) async{

    final form = FormData({
      'property_name':createBusinessModel.dataBusiness?.propertyName,
      'property_type': createBusinessModel.dataBusiness?.propertyType,
      'description':createBusinessModel.dataBusiness?.brief,
      'owner_id': box.read(Constants.OWNERID),
      'logo': MultipartFile(logoPath, filename: 'logo.png'),

    });
    return await apiClient.postDataWithFile(Constants.CREATEBUSINESS,form );
  }



}
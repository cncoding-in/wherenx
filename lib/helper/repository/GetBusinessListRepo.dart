import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../api_client.dart';
import '../constants.dart';

class GetBusinessListRepo extends GetxController implements GetxService{
  final box = GetStorage();
  final ApiClient apiClient;

  GetBusinessListRepo({required this.apiClient});
  Future<Response> getBusinessListFromRepo() async{
String ownerId = box.read(Constants.OWNERID).toString();
    return await apiClient.getData(Constants.GETBUSINESSLIST+ownerId);
  }

  // Future<Response> getDeleteBusinessFromRepo() async{
  //   String ownerId = box.read(Constants.OWNERID).toString();
  //   return await apiClient.getData(Constants.GETBUSINESSLIST+ownerId);
  // }

}
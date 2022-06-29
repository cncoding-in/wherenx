import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api_client.dart';
import '../constants.dart';

class GetBusinessListRepo extends GetxController implements GetxService{

  final ApiClient apiClient;

  GetBusinessListRepo({required this.apiClient});
  Future<Response> getBusinessListFromRepo(String owner_id) async{
    return await apiClient.getData(Constants.GETBUSINESSLIST+owner_id);
  }

}
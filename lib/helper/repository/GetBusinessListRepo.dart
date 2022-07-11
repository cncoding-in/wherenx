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

  Future<Response> getDeleteBusinessFromRepo(String businessId) async{
    String ownerId = box.read(Constants.OWNERID).toString();
    return await apiClient.deleteData(Constants.BUSINESSDELETE+"owner_id="+ownerId+"&business_id="+businessId);
  }


  Future<Response> getStatusChangeBusinessFromRepo(String businessId, String status) async{
    String ownerId = box.read(Constants.OWNERID).toString();
    return await apiClient.postData(Constants.BUSINESSSTATUS+"owner_id="+ownerId+"&business_id="+businessId+"&status="+status,"");
  }



  Future<Response> getStatusOfBusinessFromRepo(String businessId) async{
    String ownerId = box.read(Constants.OWNERID).toString();
    return await apiClient.getData(Constants.GETBUSINESSSTATUS+"owner_id="+ownerId+"&business_id="+businessId);
  }

}
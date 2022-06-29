

import 'package:businesspartner/helper/api_client.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxController implements GetxService{


  final ApiClient apiClient;

  AuthRepo({ required this.apiClient});

  Future<Response> getLoginResultFromRepo(String email, String password) async{


      return await apiClient.postData(Constants.LOGIN, toJson(email, password));
  }

  Map<String, dynamic> toJson(email, password){
    final Map<String,String> data = new Map<String,String>();
    data["email"] = email;
    data["password"] = password;
    return data;
  }

}
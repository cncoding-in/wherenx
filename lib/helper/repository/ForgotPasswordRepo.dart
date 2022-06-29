import 'package:get/get.dart';

import '../../controllers/AuthController/forgot_password_controller.dart';
import '../api_client.dart';
import '../constants.dart';

class ForgotPasswordRepo extends GetxController implements GetxService{

   final ApiClient apiClient;

  ForgotPasswordRepo({required this.apiClient});

   Future<Response> getForgotPasswordGetFromRepo(String email) async{
     return await apiClient.getData(Constants.FORGOTPASSWORDGET+email);
   }

   Future<Response> getVerifyPasswordGetFormRepo(String otpid,String otp,String newpassword) async{
     return await apiClient.postData(Constants.VERIFYPASSWORD, toJson(otpid, otp, newpassword));
   }

   Map<String, dynamic> toJson(otpid, otp, newpassword ){
     final Map<String,String> data = new Map<String,String>();
     data["otp_id"] = otpid;
     data["otp"] = otp;
     data["new_password"] = newpassword;
     return data;
   }


}
import 'package:businesspartner/helper/repository/ForgotPasswordRepo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../helper/constants.dart';
import '../../models/AuthModel/ForgotPasswordGetModel.dart';
import '../../routes/route_helper.dart';

class ForgotPasswordController extends GetxController{

  final ForgotPasswordRepo forgotPasswordRepo;
  final box = GetStorage();

   ForgotPasswordController({required this.forgotPasswordRepo});

  Future<void> getForgotPasswordGetResult(String email)async {
    Response response = await forgotPasswordRepo.getForgotPasswordGetFromRepo(email) ;
    if(response.statusCode==200){
      print(response.body.toString());
      final forgotPasswordGetModel = ForgotPasswordGetModel.fromJson(response.body);
     // print(getUserLoginModel.status);
     // print(getUserLoginModel.userData?.name);
      if(forgotPasswordGetModel.status=="success"){
        box.write(Constants.OTP, forgotPasswordGetModel.data?.otp);
        box.write(Constants.OTPID, forgotPasswordGetModel.data?.otpId);
        print(box.read(Constants.OTPID));
         Get.offNamed(RouteHelper.getAuthForgotPasswordGetPage());
      }else{

        print("Email is Not registered");

      }

    } else{

      print("something went wrong");
    }


  }

  Future<void>getVerifyPasswordGetResult(String otpid,String otp,String newpassword)async {
    Response response = await forgotPasswordRepo.getVerifyPasswordGetFormRepo(otpid, otp, newpassword) ;
    if(response.statusCode==200){
      print(response.body.toString());

     final forgotPasswordGetModel = ForgotPasswordGetModel.fromJson(response.body);

    // print(getUserLoginModel.status);
    // print(getUserLoginModel.userData?.name);

      if(forgotPasswordGetModel.status=="success"){
        box.write(Constants.OTP, forgotPasswordGetModel.data?.otp);
        box.write(Constants.OTPID, forgotPasswordGetModel.data?.otpId);
        print(box.read(Constants.OTPID));
         Get.offNamed(RouteHelper.getInitial());
      }else{
        print("Email is Not registered");
      }

    } else{
      print("something went wrong");
    }


  }


}
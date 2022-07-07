import 'package:businesspartner/helper/repository/ForgotPasswordRepo.dart';
import 'package:businesspartner/pages/Helper/Loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../helper/constants.dart';
import '../../models/AuthModel/ForgotPasswordGetModel.dart';
import '../../routes/route_helper.dart';

class ForgotPasswordController extends GetxController{

  final ForgotPasswordRepo forgotPasswordRepo;
  final box = GetStorage();
  Loading loading = new Loading();
   ForgotPasswordController({required this.forgotPasswordRepo});

  Future<void> getForgotPasswordGetResult(String email, bool resend)async {
    loading.showLoading(title: "Please wait...");
    Response response = await forgotPasswordRepo.getForgotPasswordGetFromRepo(email) ;
    if(response.statusCode==200){
      loading.hideLoading();
      final forgotPasswordGetModel = ForgotPasswordGetModel.fromJson(response.body);
      if(forgotPasswordGetModel.status=="success"){
        box.write(Constants.OTP, forgotPasswordGetModel.data?.otp);
        box.write(Constants.OTPID, forgotPasswordGetModel.data?.otpId);
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "OTP Sent Successfully..!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
         resend == true? "":Get.toNamed(RouteHelper.getAuthForgotPasswordGetPage());
      }else{

        Fluttertoast.showToast(
            msg: forgotPasswordGetModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.back();

      }

    } else{

      Fluttertoast.showToast(
          msg: "Something went wrong !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();
    }


  }

  Future<void>getVerifyPasswordGetResult(String otpid,String otp,String newpassword)async {
    loading.showLoading(title: "Changing your password !");
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
        loading.hideLoading();
        Fluttertoast.showToast(
            msg: "Password changed successfully !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
         Get.offNamed(RouteHelper.getInitial());
      }else{
        Fluttertoast.showToast(
            msg: forgotPasswordGetModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.back();
      }

    } else{

      Fluttertoast.showToast(
          msg: "Something went wrong !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();
    }


  }


}
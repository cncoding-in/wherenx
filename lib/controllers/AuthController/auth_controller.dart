import 'package:businesspartner/helper/constants.dart';
import 'package:businesspartner/helper/repository/AuthRepo.dart';
import 'package:businesspartner/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/AuthModel/GetUserLoginModel.dart';
import '../../pages/Helper/Loading.dart';

class AuthController extends GetxController{

  final AuthRepo authRepo;

  final box = GetStorage();

  AuthController({required this.authRepo});

  Loading loading = new Loading();
  Future<void> getLoginResult(String email, String password)async {


    loading.showLoading(title: "Please wait...");
    Response response = await authRepo.getLoginResultFromRepo(email,password) ;



    if(response.statusCode==200){
      final getUserLoginModel = GetUserLoginModel.fromJson(response.body);
      if(getUserLoginModel.status=="success"){
        box.write(Constants.NAME, getUserLoginModel.userData?.name);
        box.write(Constants.EMAIL, getUserLoginModel.userData?.email);
        box.write(Constants.OWNERID, getUserLoginModel.userData?.ownerId);
        box.write(Constants.PROFILEPHOTO, getUserLoginModel.userData?.profilePhoto);
        box.write(Constants.LOGINSTATUS, "true");

        loading.hideLoading();
        Constants.OWNERID_DATA = getUserLoginModel.userData!.ownerId.toString();
        Get.offNamed(RouteHelper.getDashboardPage());
      }else{
        loading.hideLoading();
        Fluttertoast.showToast(
            msg:getUserLoginModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } else{
      loading.hideLoading();
      Fluttertoast.showToast(
          msg: "Oohps..failed, Try again !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }


  }

  logout() {

    box.erase();
    Constants.OWNERID_DATA="";
    Get.offNamed(RouteHelper.getInitial());
  }


}
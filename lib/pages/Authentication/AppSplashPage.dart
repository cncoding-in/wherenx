import 'dart:async';

import 'package:businesspartner/helper/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/constants.dart';
import '../../routes/route_helper.dart';

class AppSplashPage extends StatefulWidget {
  const AppSplashPage({Key? key}) : super(key: key);
  @override
  State<AppSplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<AppSplashPage> {

  @override
  Widget build(BuildContext context) {
    timerMethod();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/ic_splash_image.png'),
                fit: BoxFit.cover
            )
        ),
      ),
    );

  }

  void timerMethod() {


    Timer(const Duration(seconds: 1),
                ()=> Get.offNamed(RouteHelper.getAuthLoginPage()));


    // bool check = getBoolValuesSF() as bool;
    // if(check){
    //   print("if :"+check.toString());
    //   // Timer(const Duration(seconds: 1),
    //   //         ()=> Get.offNamed(RouteHelper.getAuthLoginPage()));
    // }else{
    //
    //     print("else :" + check.toString());
    //     // Timer(const Duration(seconds: 1),
    //     //         ()=> Get.offNamed(RouteHelper.getDashboardPage()));
    //   }
    //
    // }

  // Future<bool?> getBoolValuesSF() async {
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //      //Return bool
  //      bool? boolValue = prefs.getBool('LOGIN_STATUS');
  //      return boolValue;
  //
  // }

    // if(loginStatus == "false"){
    //       Timer(const Duration(seconds: 1),
    //       ()=> Get.offNamed(RouteHelper.getAuthLoginPage()));
    //
    // }else{
    //   Timer(const Duration(seconds: 1),
    //           ()=> Get.offNamed(RouteHelper.getDashboardPage()));
    // }
    // Timer(const Duration(seconds: 1),
    //
    //         if(i == 1){
    //
    // }
    //         ()=> Get.offNamed(RouteHelper.getAuthLoginPage())
    // );

  // getBoolValuesSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return bool
  //   bool? boolValue = prefs.getBool('LOGIN_STATUS');
  //   return boolValue;
   }


  }






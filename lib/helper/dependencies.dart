import 'package:businesspartner/controllers/AuthController/auth_controller.dart';
import 'package:businesspartner/controllers/AuthController/forgot_password_controller.dart';
import 'package:businesspartner/controllers/BusinessController/CreateBusinessController.dart';
import 'package:businesspartner/controllers/BusinessController/MediaPageController.dart';
import 'package:businesspartner/helper/repository/AuthRepo.dart';
import 'package:businesspartner/helper/repository/CreateBusinessRepo.dart';
import 'package:businesspartner/helper/repository/ForgotPasswordRepo.dart';
import 'package:businesspartner/helper/repository/GetBusinessListRepo.dart';
import 'package:get/get.dart';

import '../controllers/AuthController/AppSplashController.dart';
import '../controllers/BusinessController/GetBusinessListController.dart';
import 'api_client.dart';
import 'constants.dart';


Future<void> init()async {

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.BASE_URL));

  // repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
  Get.lazyPut(() => ForgotPasswordRepo(apiClient: Get.find()));
  Get.lazyPut(() => CreateBusinessRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetBusinessListRepo(apiClient: Get.find()));


  // controllers

  Get.put<AuthController>(AuthController(authRepo: Get.find()), permanent: true);
  Get.put<ForgotPasswordController>(ForgotPasswordController(forgotPasswordRepo: Get.find()), permanent: true);
  Get.put<CreateBusinessController>(CreateBusinessController(createBusinessRepo: Get.find()), permanent: true);
  Get.put<AppSplashControlller>(AppSplashControlller(), permanent: true);
  Get.put<GetBusinessListController>(GetBusinessListController(getBusinessListRepo: Get.find()), permanent: true);
  Get.put<MediaPageController>(MediaPageController(), permanent: true);




}
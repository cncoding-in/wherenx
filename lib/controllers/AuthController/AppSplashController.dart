import 'package:businesspartner/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../helper/constants.dart';

class AppSplashControlller extends GetxController{
  final box = GetStorage();

  checkLoginroute(){



   // print(box.read(Constants.LOGINSTATUS)!);
    if(box.read(Constants.LOGINSTATUS)!=null){

      if (box.read(Constants.LOGINSTATUS) == "true"){
        print(Constants.OWNERID_DATA);
        Constants.OWNERID_DATA = box.read(Constants.OWNERID).toString();
        Get.offNamed(RouteHelper.getDashboardPage());
      }
    } else {
      Constants.OWNERID_DATA = "";
      Get.offNamed(RouteHelper.getAuthLoginPage());
    }
  }


}
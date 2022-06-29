import 'package:businesspartner/helper/constants.dart';
import 'package:businesspartner/helper/repository/AuthRepo.dart';
import 'package:businesspartner/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/AuthModel/GetUserLoginModel.dart';

class AuthController extends GetxController{

  final AuthRepo authRepo;

  final box = GetStorage();

  AuthController({required this.authRepo});


  Future<void> getLoginResult(String email, String password)async {


    Response response = await authRepo.getLoginResultFromRepo(email,password) ;



    if(response.statusCode==200){

      print(response.body.toString());

      final getUserLoginModel = GetUserLoginModel.fromJson(response.body);

      print(getUserLoginModel.status);
      print(getUserLoginModel.userData?.name);

      if(getUserLoginModel.status=="success"){
        box.write(Constants.NAME, getUserLoginModel.userData?.name);
        box.write(Constants.EMAIL, getUserLoginModel.userData?.email);
        box.write(Constants.LOGINSTATUS, "true");

        print(box.read(Constants.NAME));
        Get.offNamed(RouteHelper.getDashboardPage());
      }else{


      }

    } else{
      print("something went wrong");
    }


  }


}
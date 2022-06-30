import 'package:businesspartner/helper/repository/GetBusinessListRepo.dart';
import 'package:businesspartner/models/BusinessModel/GetBusinessListModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetBusinessListController extends GetxController{
  final GetBusinessListRepo getBusinessListRepo;
  GetBusinessListController({required this.getBusinessListRepo});

  late var getBusinessListModel = new GetBusinessListModel();


  int length  =0;


  Future<void> getBusinessListGetResult()async {
    Response response = await getBusinessListRepo.getBusinessListFromRepo() ;
    if(response.statusCode==200){
      print(response.body.toString());
     getBusinessListModel  = GetBusinessListModel.fromJson(response.body);
     length =  (getBusinessListModel.dataBusiness?.length==null? 0
          : getBusinessListModel.dataBusiness?.length)!;


      update();
      print(getBusinessListModel.status);
      print(getBusinessListModel.dataBusiness);
      print(getBusinessListModel.message);
      print(getBusinessListModel.dataBusiness?.length);
      if(getBusinessListModel.status=="success"){
        Fluttertoast.showToast(
            msg: "Business list refrshed !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg: "No record found !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0
        );


      }

    } else{
      // Fluttertoast.showToast(
      //     msg: "Something went wrong !",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.orange,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );

    }


  }
  //
  // Future<void> getDeleteBusinessResult (int index) async{
  //   Response response = await getBusinessListRepo.getBusinessListFromRepo() ;
  //   if(response.statusCode==200){
  //     print(response.body.toString());
  //     getBusinessListModel  = GetBusinessListModel.fromJson(response.body);
  //     length =  (getBusinessListModel.dataBusiness?.length==null? 0
  //         : getBusinessListModel.dataBusiness?.length)!;
  //
  //
  //     update();
  //     print(getBusinessListModel.status);
  //     print(getBusinessListModel.dataBusiness);
  //     print(getBusinessListModel.message);
  //     print(getBusinessListModel.dataBusiness?.length);
  //     if(getBusinessListModel.status=="success"){
  //       Fluttertoast.showToast(
  //           msg: "Business list refrshed !",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 16.0
  //       );
  //
  //     }else{
  //       Fluttertoast.showToast(
  //           msg: "No record found !",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.orange,
  //           textColor: Colors.white,
  //           fontSize: 16.0
  //       );
  //
  //
  //     }
  //
  //   } else{
  //     // Fluttertoast.showToast(
  //     //     msg: "Something went wrong !",
  //     //     toastLength: Toast.LENGTH_SHORT,
  //     //     gravity: ToastGravity.BOTTOM,
  //     //     timeInSecForIosWeb: 1,
  //     //     backgroundColor: Colors.orange,
  //     //     textColor: Colors.white,
  //     //     fontSize: 16.0
  //     // );
  //
  //   }
  // }

}
import 'package:businesspartner/helper/repository/GetBusinessListRepo.dart';
import 'package:businesspartner/models/BusinessModel/GetBusinessListModel.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GetBusinessListController extends GetxController{
  final GetBusinessListRepo getBusinessListRepo;
  GetBusinessListController({required this.getBusinessListRepo});


  List<dynamic> _getBusinessList=[];
  List<dynamic> get getAllhBusinessList => _getBusinessList;


  Future<void> getBusinessListGetResult(String owner_id)async {
    Response response = await getBusinessListRepo.getBusinessListFromRepo(owner_id) ;
    if(response.statusCode==200){
      print(response.body.toString());
      final getBusinessListModel = GetBusinessListModel.fromJson(response.body);

      print(getBusinessListModel.status);
      print(getBusinessListModel.dataBusiness);
      print(getBusinessListModel.message);

      if(getBusinessListModel.status=="success"){

        print("success YYYYYY ");

      }else{

        print("not success XXXXXX");

      }

    } else{

      print("something went wrong");
    }


  }

}
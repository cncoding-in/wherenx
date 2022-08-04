import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api_client.dart';
import '../constants.dart';

class PinnedBusinessMapRepo extends GetxController implements GetxService {

  late final ApiClient apiClient;

  PinnedBusinessMapRepo({required this.apiClient});

  Future<Response> getPinnedBusinessMapRepo() async {
    return await apiClient.getData(Constants.PINNEDPROPERTY);
  }
}
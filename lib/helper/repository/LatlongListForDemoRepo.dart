import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/BusinessModel/MapMarkerPinnedModel.dart';
import '../api_client.dart';
import '../constants.dart';

class LatlongListForDemoRepo extends GetxController implements GetxService {

  late final ApiClient apiClient;

  LatlongListForDemoRepo({required this.apiClient});

  Future<Response> getPinnedBusinessMapResult(MapMarkerPinnedModel mapMarkerPinnedModel ) async {
    return await apiClient.postData(Constants.PINNEDPROPERTY,mapMarkerPinnedModel.toJson() );
  }
}
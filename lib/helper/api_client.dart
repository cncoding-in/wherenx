
import 'package:get/get.dart';

import 'constants.dart';


class ApiClient extends GetConnect implements GetxService{
  late String token = Constants.TOKEN;
  final String appBaseUrl;


  late Map<String,String> _mainHeaders;

  ApiClient({ required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 10);
    _mainHeaders={
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    print(uri);
    try{
          Response response = await get(uri);
          print(response);
          return response;
    } catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

    }

  Future<Response> postData(String uri, dynamic body) async {
    print(uri);

    try{
      print(body.toString());

      Response response = await post(uri, body,headers: _mainHeaders) ;
      print(Constants.BASE_URL+uri);

      print(response.body.toString());
      return response;
    }catch (e){
      print(e.toString());
      return Response(statusText: e.toString(),statusCode: 1);
    }
  }

  Future<Response> deleteData(String uri) async {
    print(uri);
    try{
      Response response = await delete(uri);
      print(response);
      return response;
    } catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }



// Send data with file and data using form
  Future<Response> postDataWithFile(String uri, FormData formData) async {

    print("api calling started");
    print(uri);
    print(formData.toString());

    try{
      // final form = FormData({
      //   'title':"title hari name",
      //   'photo': MultipartFile(uri, filename: 'avatar.png'),
      //
      // });
      Response response = await post(uri, formData);
      print(response.body.toString());
      return response;
    }catch (e){
      print(e.toString());
      return Response(statusText: e.toString(),statusCode: 1);
    }
  }
 // postDataWithFile1() async {
 //
 //
 //      var formData = Dio.FormData.fromMap({
 //        'name': 'wendux',
 //        'age': 25,
 //        'photo': await Dio.MultipartFile.fromFile('assets/images/ic_splash_image.png',filename: 'ic_splash_image.png')
 //      });
 //    var  response = await dio.post('https://www.2designnerds.com/wherenx/public/api/businesspartner/imageupload', data: formData);
 //
 //    print(response);
 //
 //  }


  }



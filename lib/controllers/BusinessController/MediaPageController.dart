import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class MediaPageController extends GetxController{

  var isPhotoSelected='false'.obs;
  var selectedImagePath=''.obs;
  var selectedImageSize=''.obs;
  var cropImagePath=''.obs;
  var cropImageSize=''.obs;
  var compressImagePath=''.obs;
  var compressImageSize=''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource,imageQuality: 50);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";
      // Compress
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          selectedImagePath.value,
          targetPath, quality: 50);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
      print(compressImageSize.value);


      print(selectedImageSize.value);
      print(cropImageSize.value);
      print(compressImagePath.value);

      isPhotoSelected.value="true";

      // ApiClient(appBaseUrl: '').postData1(compressImagePath.value);
      //postDataWithFile1(selectedImagePath.value);

    } else {

      Fluttertoast.showToast(
          msg: "No image selected !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  final box = GetStorage();


}
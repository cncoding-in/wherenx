import 'dart:io';

import 'package:businesspartner/controllers/BusinessController/CreateBusinessController.dart';
import 'package:businesspartner/controllers/BusinessController/MenuBusinessController.dart';
import 'package:businesspartner/models/BusinessModel/CreateBusinessModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/constants.dart';
class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();

}


class _BusinessDetailsState extends State<BusinessDetails> {

  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController briefController = TextEditingController();
  bool rebuild = false;
  late String photoUrl ;

  @override
  void initState() {
    super.initState();
    nameController.text = Get.find<MenuBusinessController>().propertyName.toString();
    typeController.text = Get.find<MenuBusinessController>().propertyType.toString();
    briefController.text = Get.find<MenuBusinessController>().brief.toString();
    photoUrl = Get.find<MenuBusinessController>().photoPath.toString();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: 200.0,
          width: 150.0,
        ),
      ),

      body:

     Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    "Details",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  Center(
                    child: Stack(
                      children: [

                        Obx(() => Get.find<MenuBusinessController>().selectedImagePath.value.isEmpty?
                        CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              photoUrl
                              ,
                            )
                        )
                        :
                            CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(Get.find<MenuBusinessController>().selectedImagePath.value)),
                             )
                        ),







                        GestureDetector(
                          onTap: (){
                            Get.find<MenuBusinessController>().getImage(ImageSource.gallery);
                          },
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 130, top: 20),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                backgroundImage: const AssetImage(
                                  "assets/images/ic_profile_image_edit.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),




                  SizedBox(
                    height: 20,
                  ),

                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: typeController,
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Property Type',
                    ),
                    //  controller: myController,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextField(
                    textInputAction: TextInputAction.next,
                      controller: nameController,
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Property Name',

                    ),
                    // controller: myController,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Brief",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Container(
                    height: 200,
                    child: SizedBox(
                      child: Card(
                        elevation: 1.0,
                        shadowColor: Colors.blue,
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blueAccent,width:1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            controller: briefController,
                            maxLines:10,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            cursorHeight: 20,
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                            ),
                            // controller: myController,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            saveBusiness();
                          },
                          child: Text('SAVE'),
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

      ),

    );
  }

  void saveBusiness() {

    if(typeController.text.isEmpty || nameController.text.isEmpty || briefController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Some data missing, check correctly !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );

      print("if block true");
    }else{
      print(nameController.text);
      print(typeController.text);
      print(briefController.text);



      Get.find<MenuBusinessController>().getBusinessDetailsPostResultData(typeController.text,nameController.text,briefController.text);
    }

  }
}

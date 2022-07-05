import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/BusinessController/CreateBusinessController.dart';
import '../../controllers/BusinessController/MediaPageController.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';

class Uploadmedia extends StatefulWidget {
  const Uploadmedia({Key? key}) : super(key: key);

  @override
  State<Uploadmedia> createState() => _UploadmediaState();
}

class _UploadmediaState extends State<Uploadmedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.size50),
        // actions: <Widget>[
        //   // IconButton(
        //   //   icon: Image.asset('assets/images/ic_manprofile.png'),
        //   //   onPressed: () => Get.to(RouteHelper.mediaPage),
        //   // ),
        // ],

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.size10, vertical: Dimensions.size10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "UPLOAD MEDIA",
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height:  Dimensions.size20,
              ),

              Card(
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.size10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                    child: Stack(
                  children: [

                    Obx(() => Get.find<MediaPageController>()
                        .selectedImagePath ==
                        ""
                        ? Container(

                      height: Dimensions.size250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/ic_property_media_0.png"),
                            //fit: BoxFit.cover,
                          )),
                    )
                        : Container(

                      height: Dimensions.size200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(
                                Get.find<MediaPageController>()
                                    .selectedImagePath
                                    .value)),
                            fit: BoxFit.fill,
                          )),
                    )),

                      //     GestureDetector(
                    //   onTap: (){
                    //     Get.find<CreateBusinessController>().getImage(ImageSource.gallery);
                    //   },
                    //   child: Container(
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //           left: Dimensions.size250, top: Dimensions.size15),
                    //       child: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: Colors.white,
                    //         backgroundImage: const AssetImage(
                    //           "assets/images/ic_profile_image_edit.png",
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                      ],
                      ),
                      ),
                    ],
                  )
              ),



              SizedBox(
                height:  Dimensions.size20,
              ),
              Container(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        Get.find<MediaPageController>()
                            .getImage(ImageSource.gallery);

                       // loginNow();
                      },
                      child: Text('SELECT IMAGE'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {


                        // loginNow();
                      },
                      child: Text('UPLOD IMAGE'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,

                      ),
                    ),
                  ],
                ),
              ),

            ]),
      ),
    );
  }
}

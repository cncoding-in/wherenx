import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/BusinessController/MediaPageController.dart';
import '../../helper/Dimension.dart';
class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.size200,
          width: Dimensions.size150,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.size5,vertical: Dimensions.size5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "MEDIA",
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.size10),
                    ),
                    color: Colors.grey,
                  ),

                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child:  Row(
                    children: [

                      ///image
                    Expanded(
                      flex: 8,
                      child: Container(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() => Get.find<MediaPageController>()
                                              .selectedImagePath ==
                                          ""
                                      ? Container(
                                          width: Dimensions.size400,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/ic_default_image.jpg"),
                                            fit: BoxFit.cover,
                                          )),
                                        )
                                      : Container(
                                          width: Dimensions.size400,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: FileImage(File(
                                                Get.find<MediaPageController>()
                                                    .selectedImagePath
                                                    .value)),
                                            fit: BoxFit.cover,
                                          )),
                                        )),
                                ],
                              ),
                            ],
                          )),
                    ),

                    ////////////editor
                      Expanded(
                      flex: 2,
                      child: Container(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.find<MediaPageController>()
                                  .getImage(ImageSource.gallery);
                            },
                            child: Container(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: const AssetImage(
                                    "assets/images/ic_edit.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                  ),
                ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        //Get.to(RouteHelper.getCreateBusinessPage());

      },
        child: Icon(Icons.arrow_upward,size: Dimensions.size40,),
      ),


    );
  }
}

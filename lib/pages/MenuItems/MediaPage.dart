import 'dart:io';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/BusinessController/MediaPageController.dart';
import '../../controllers/BusinessController/MenuBusinessController.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';
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
        child:

        GetBuilder<MenuBusinessController>(builder: (media){
      return  media.mediaLength==0?
      Padding(
        padding: EdgeInsets.all(Dimensions.size10),
        child: Center(
          child: Text(
            "No media added feel free to add them",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25
            ),
          ),
        ),
      )
          :

        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: media.mediaLength,
          itemBuilder: (context,index){
            return  Padding(
              padding: EdgeInsets.only(top: Dimensions.size5,bottom: Dimensions.size5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.size10),
                  ),
                  color: Colors.grey,
                ),

                width: Dimensions.screenWidth,
                height: Dimensions.size200,
                child:  Row(
                  children: [

                    ///image
                    Flexible(
                      flex: 8,
                      child:  Container(

                        height: Dimensions.size200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                media.menuMediaGetModel.dataBusiness![index].imageUrl.toString()
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),),


                    ////////////editor
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Constants.MEDIAID = media.menuMediaGetModel.dataBusiness![index].imageId.toString();
                              Get.find<MenuBusinessController>()
                                  .getMenuMediaDeleteDetails();
                            },
                            child: Container(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: const AssetImage(
                                    "assets/images/ic_delete.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            );
          },
        );



        }),


      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        Get.find<MediaPageController>()
            .compressImagePath.value="";
        Get.find<MediaPageController>()
            .selectedImagePath.value="";
       Get.offNamed(RouteHelper.getUploadMediaPage());

      },
        child: Icon(Icons.arrow_upward,size: Dimensions.size40,),
      ),


    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
          height: Dimensions.logoHeight,
          width: Dimensions.logowidth,),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/ic_manprofile.png'),
            onPressed: () => Get.toNamed(RouteHelper.getAuthLoginPage()),
          ),
        ],

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.size5, vertical: Dimensions.size5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "UPLOAD MEDIA",
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

            Card(
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.size20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.size5),
                          child: Row(
                            children: [
                              Image.asset('assets/images/ic_property_media_0.png',width: Dimensions.size85,height: Dimensions.size85,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),

            ]),
      ),
    );
  }
}

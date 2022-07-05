import 'package:businesspartner/controllers/BusinessController/MenuBusinessController.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';

class AllMenu extends StatefulWidget {
  const AllMenu({Key? key}) : super(key: key);

  @override
  State<AllMenu> createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
   bool isActive = true;

  @override
  Widget build(BuildContext context) {

    print(Constants.MENU_BUSINESS_INDEX);
    int? selectedIndex;
    bool isActive;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.logoHeight,
          width: Dimensions.logowidth,),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Image.asset('assets/images/ic_manprofile.png'),
        //     onPressed: () => Get.toNamed(RouteHelper.getAuthLoginPage()),
        //   ),
        // ],

      ),


      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.size10,vertical: Dimensions.size10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                    flex: 5,
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(RouteHelper.getAllMenu());
                        },
                        child: Card(
                            elevation: 5.0,
                            shadowColor: Colors.grey,
                            color: selectedIndex != null ? Colors.grey[300] : Colors.lightBlueAccent,
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
                                       Image.asset('assets/images/ic_property_details_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                        Text(
                                          "DETAILS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Dimensions.size20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                          )
                        ),
                      ),
                  ),
                    SizedBox(width: Dimensions.size5),
                    GestureDetector(
                      onTap: (){
                        Get.find<MenuBusinessController>().getMenuADDRESSDetails();
                      },
                      child: Expanded(
                        flex: 5,
                        child: Card(
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
                                        Image.asset('assets/images/ic_property_address_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                        Text(
                                          "ADDRESS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Dimensions.size20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),

                ],
              ),

            SizedBox(height: Dimensions.size10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Card(
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
                                  Image.asset('assets/images/ic_property_media_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                  Text(
                                    "MEDIA",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.size20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(width: Dimensions.size5),
                GestureDetector(
                  onTap: (){
                    Get.find<MenuBusinessController>().getMenuLocationDetails();
                  },
                  child: Expanded(
                    flex: 5,
                    child: Card(
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
                                    Image.asset('assets/images/ic_property_location_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                    Text(
                                      "LOCATION",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.size20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: Dimensions.size10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  flex: 5,
                  child: Card(
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
                              padding: EdgeInsets.all(Dimensions.size2),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/ic_property_bizhours_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                  Text(
                                    "BIZ HOURS",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.size20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(width: Dimensions.size5),
                Expanded(
                  flex: 5,
                  child: Card(
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
                                  Image.asset('assets/images/ic_property_offers_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                  Text(
                                    "OFFERS",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.size20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),

              ],
            ),

            SizedBox(height: Dimensions.size10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                GestureDetector(
                  onTap: (){
                    Get.find<MenuBusinessController>().getMenuCouponDetails();
                  },
                  child: Expanded(
                    flex: 5,
                    child: Card(
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
                                    Image.asset('assets/images/ic_property_coupons_0.png',width: Dimensions.size55,height: Dimensions.size85,),
                                    Text(
                                      "COUPONS",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.size20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.size5),
                Expanded(
                  flex: 5,
                  child: Card(
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
                              //padding: EdgeInsets.all(Dimensions.size5),
                              child: Row(
                                children: [
                                  // Image.asset('assets/images/ic_property_details_0.png',width: 85,height: 85,),
                                  // Text(
                                  //   "CLUTCH BAR",
                                  //   style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontSize: Dimensions.size20,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }




}

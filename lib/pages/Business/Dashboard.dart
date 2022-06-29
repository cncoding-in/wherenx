import 'package:businesspartner/controllers/BusinessController/CreateBusinessController.dart';
import 'package:businesspartner/helper/Dimension.dart';
import 'package:businesspartner/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../controllers/AuthController/forgot_password_controller.dart';
import '../../controllers/BusinessController/GetBusinessListController.dart';
import '../../models/BusinessModel/GetBusinessListModel.dart';
import '../../routes/route_helper.dart';
import '../../routes/route_helper.dart';
import '../../routes/route_helper.dart';
import '../../routes/route_helper.dart';
import 'CreateBusiness.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    getBusinessList();
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
          children: <Widget>[
            Container(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                     // padding: EdgeInsets.all(Dimensions.size5),
                      child: Card(
                        elevation: 1.0,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.size5),
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
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: const AssetImage(
                                          "assets/images/ic_wherenx_logo_large.png"),
                                    ),
                                    SizedBox(
                                      width: Dimensions.size10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Wrap(children: <Widget>[
                                                    Text(
                                                      "CLUTCH ",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions.size20,
                                                          fontWeight: FontWeight.bold),
                                                        overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(width: Dimensions.size5),
                                                    Container(
                                                        width: Dimensions.size60,
                                                        height: Dimensions.size20,
                                                        child: SizedBox(
                                                          width: Dimensions.size30,
                                                          child: FittedBox(
                                                            fit: BoxFit.fill,
                                                            child: RollingSwitch
                                                                .icon(
                                                              onChanged:
                                                                  (bool state) {
                                                                print(
                                                                    'turned ${(state) ? 'on' : 'off'}');
                                                              },
                                                              rollingInfoRight:
                                                              const RollingIconInfo(
                                                                icon:
                                                                Icons.check,
                                                                text: Text(
                                                                  'On',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      20),
                                                                ),
                                                              ),
                                                              rollingInfoLeft:
                                                              const RollingIconInfo(
                                                                icon:
                                                                Icons.check,
                                                                backgroundColor:
                                                                Colors.grey,
                                                                text: Text(
                                                                  'Off',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ]
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "The vibe is the bar, \nthe vibe is the people.......",
                                                style: TextStyle(
                                                  // backgroundColor: Colors.black,
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                     // padding: EdgeInsets.all(Dimensions.size5),
                      child: Card(
                        elevation: 1.0,
                        shadowColor: Colors.grey,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.size5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: Dimensions.size10),

                            CircleAvatar(
                              radius: 25,
                              backgroundImage: const AssetImage(
                                  "assets/images/ic_delete.png"),
                            ),
                            SizedBox(height: 10),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: const AssetImage(
                                  "assets/images/ic_edit.png"),
                            ),
                            SizedBox(height: Dimensions.size10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
         Get.to(CreateBusiness());
         //Get.to(RouteHelper.getCreateBusinessPage());

      },
        child: Icon(Icons.add,size: Dimensions.size40,),
      ),

    );
  }



  void getBusinessList() {
    //
    // GetBusinessListModel getBusinessListModel = new   GetBusinessListModel ();
     Get.find<GetBusinessListController>().getBusinessListGetResult("7") ;
  //  GetBusinessListModel getBusinessListModel = Get.find<GetBusinessListController>().getBusinessListGetResult("7") ;


   // SearchBusinessPostDataModel searchBusinessPostDataModel = SearchBusinessPostDataModel(location:   userLocation, radius: '15000', nextPageToken: '', userId: '', type: '', keyword: keyword);
   // Get.find<SearchBusinessController>().getSearchBusinessLists(searchBusinessPostDataModel, context);

  //  print( getBusinessListModel.dataBusiness);

  }

}

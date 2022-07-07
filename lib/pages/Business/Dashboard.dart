import 'package:businesspartner/controllers/AuthController/auth_controller.dart';
import 'package:businesspartner/controllers/BusinessController/CreateBusinessController.dart';
import 'package:businesspartner/helper/Dimension.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../controllers/BusinessController/GetBusinessListController.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.logout
            ),
            onPressed: () => Get.find<AuthController>().logout(),
          ),
        ],
      ),



      body:
      GetBuilder<GetBusinessListController>(builder: (businessList){
      return  businessList.length==0?
        Padding(
          padding: EdgeInsets.all(Dimensions.size10),
          child: Center(
            child: Text(
              "No property added feel free to add them",
                  style: TextStyle(
                color: Colors.black,
              fontSize: 25
            ),
            ),
          ),
        )
        :
        ListView.builder(
        itemCount: businessList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return Container(
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
                                            backgroundImage: NetworkImage(
                                                businessList.getBusinessListModel.dataBusiness![index].logo.toString()


                                            )),
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
                                                          Container(
                                                            width: Dimensions.size130,
                                                            child: Text(
                                                              businessList.getBusinessListModel.dataBusiness![index].businessName.toString(),
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: Dimensions.size20,
                                                                  fontWeight: FontWeight.bold),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
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

                                                                      chanegStatus(index,state);

                                                                    },
                                                                    initialState:

                                                                    businessList.getBusinessListModel.dataBusiness![index].status.toString()=="Active"
                                                                    ?true :false

                                                                    ,
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
                                                        ]),
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
                                                businessList.getBusinessListModel.dataBusiness![index].description.toString(),
                                                      style: TextStyle(
                                                        // backgroundColor: Colors.black,
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.normal),
                                                      overflow: TextOverflow.ellipsis,
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

                                  GestureDetector(
                                    onTap: (){
                                      deleteBusiness(index);
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: const AssetImage(
                                          "assets/images/ic_delete.png"),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: (){
                                      editBusiness(index);
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: const AssetImage(
                                          "assets/images/ic_edit.png"),
                                    ),
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
            );
          }

      );
      }),

      floatingActionButton: FloatingActionButton(onPressed: () {
         Get.to(CreateBusiness());
         //Get.to(RouteHelper.getCreateBusinessPage());

      },
        child: Icon(Icons.add,size: Dimensions.size40,),
      ),

    );
  }



  void getBusinessList() {
     Get.find<GetBusinessListController>().getBusinessListGetResult() ;
  }

  void deleteBusiness(int index) {

     Get.find<GetBusinessListController>().getDeleteBusinessResult(index) ;
  }

  void editBusiness(int index) {
    Get.find<GetBusinessListController>().getEditBusinessResult(index);
  }

  void chanegStatus(int index,bool state) {

    state==true?    Get.find<GetBusinessListController>().getStatusChangeBusinessResult(index,"Active")
    :     Get.find<GetBusinessListController>().getStatusChangeBusinessResult(index,"InActive");

  }

}

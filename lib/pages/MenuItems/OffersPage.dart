import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:vector_math/vector_math.dart' as v_math;
import 'package:dotted_line/dotted_line.dart';
import '../../controllers/BusinessController/MenuBusinessController.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';
class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

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
    GetBuilder<MenuBusinessController>(builder: (offer){
         return  offer.offerLength==0?
         Padding(
         padding: EdgeInsets.all(Dimensions.size10),
        child: const Center(
        child: Text(
        "No offer added feel free to add them",
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
          itemCount:  offer.offerLength,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.only(top: Dimensions.size5),
              child: ClipPath(
                clipper: DolDurmaClipper(right: Dimensions.screenWidth-Dimensions.size132, holeRadius: Dimensions.size10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.size10),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    offer.menuOfferModel.offerData![index].rate.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.size35,
                                        fontWeight: FontWeight.bold),
                                  ),

                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "OFF",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.size20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                ],
                              ),
                            ],
                          )),


                      SizedBox(width: Dimensions.size1,

                        child: Container(
                          color: Colors.white,),
                      ),

                      Expanded(
                          flex: 7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.size10),
                                  bottomRight: Radius.circular(Dimensions.size10)),
                              color: Colors.lightBlueAccent[100],),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Container(

                                      padding: EdgeInsets.only(left: Dimensions.size20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Container(

                                            child: Row(
                                              children: [
                                                Text(
                                                  "",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Dimensions.size10,
                                                      fontWeight: FontWeight.bold),
                                                ),

                                              ],
                                            ),
                                          ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: Dimensions.size150,
                                                child: Text(
                                                  offer.menuOfferModel.offerData![index].offerType.toString(),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: Dimensions.size25,
                                                      fontWeight: FontWeight.bold,
                                                      overflow: TextOverflow.ellipsis
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),

                                          SizedBox(height: Dimensions.size20),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Valid Till - "+ offer.menuOfferModel.offerData![index].endDate.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions.size10,
                                                    fontWeight: FontWeight.bold),
                                              ),

                                            ],
                                          ),
                                        ],
                                      )),

                                ),


                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: Dimensions.size10),
                                        Container(
                                            width: Dimensions.size100,
                                            height: Dimensions.size40,
                                            child: SizedBox(
                                              width: Dimensions.size30,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: RollingSwitch
                                                    .icon(
                                                  onChanged:
                                                      (bool state) {
                                                        chanegStatus(index,state);


                                                  },
                                                  initialState:

                                                  offer.menuOfferModel.offerData![index].status.toString()=="Active"
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
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        SizedBox(height: Dimensions.size10),
                                        GestureDetector(
                                          onTap: (){
                                            Constants.MOFFERID = offer.menuOfferModel.offerData![index].offersId.toString();
                                            print(offer.menuOfferModel.offerData![index].offersId.toString());
                                            Get.find<MenuBusinessController>()
                                                .getMenuOfferDeleteDetails();
                                          },
                                          child: CircleAvatar(
                                            radius: Dimensions.size25,
                                            backgroundImage: const AssetImage(
                                                "assets/images/ic_delete.png"),
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.size10),
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),

                          )
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        );

    }),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Dimensions.size90),
        child: FloatingActionButton(onPressed: () {

          Get.offNamed(RouteHelper.getAddOffersPage());

        },
          child: Icon(Icons.add,size: Dimensions.size40,),
        ),
      ),
    );
  }

  void chanegStatus(int index, bool state) {
    state==true?    Get.find<MenuBusinessController>().getStatusChangeOfferResult(index,"Active")
        :     Get.find<MenuBusinessController>().getStatusChangeOfferResult(index,"InActive");

  }
}
class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});
  final double right;
  final double holeRadius;
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;

  void chanegStatus(int index,bool state) {

    state==true?    Get.find<MenuBusinessController>().getStatusChangeOfferResult(index,"Active")
        :     Get.find<MenuBusinessController>().getStatusChangeOfferResult(index,"InActive");

  }
}
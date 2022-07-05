import 'package:flutter/material.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:vector_math/vector_math.dart' as v_math;
import 'package:dotted_line/dotted_line.dart';
import '../../helper/Dimension.dart';
class CouponsPage extends StatelessWidget {
  const CouponsPage({Key? key}) : super(key: key);

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
                    "COUPONS",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      fontSize: Dimensions.size25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                ClipPath(
                  clipper: DolDurmaClipper(right: Dimensions.screenWidth-120, holeRadius: Dimensions.size10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.size10),
                      ),
                      color: Colors.lightBlueAccent,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.size150,
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
                                        "100%",
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

                        SizedBox(width: Dimensions.size5),
                        SizedBox(width: Dimensions.size1,

                          child: Container(
                          color: Colors.white,),
                             ),

                        Expanded(
                          flex: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
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
                                                  "Coupon Code",
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
                                              Text(
                                                "BFDAY10",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: Dimensions.size35,
                                                    fontWeight: FontWeight.bold),
                                              ),

                                            ],
                                          ),

                                          SizedBox(height: Dimensions.size20),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Valid Till - July 31 2022 8pm",
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
                                                          fontSize: 20),
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
                                        SizedBox(height: 10),
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: const AssetImage(
                                              "assets/images/ic_delete.png"),
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
              ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        //Get.to(RouteHelper.getCreateBusinessPage());

      },
        child: Icon(Icons.add,size: Dimensions.size40,),
      ),
    );
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
}
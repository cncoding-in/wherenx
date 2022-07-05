import 'package:flutter/material.dart';
import '../../helper/Dimension.dart';
class BusinessHoursPage extends StatelessWidget {
  const BusinessHoursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
            height: Dimensions.size50),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.size20, vertical: Dimensions.size20),
        child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


            Text(
              "Business Hours",
              // style: TextStyle(fontWeight: FontWeight.bold),
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        ),
        ),
      ),
    );
  }
}

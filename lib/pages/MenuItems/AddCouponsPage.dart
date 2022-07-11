import 'package:businesspartner/controllers/BusinessController/MenuBusinessController.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../helper/Dimension.dart';
class AddCouponsPage extends StatefulWidget {
  const AddCouponsPage({Key? key}) : super(key: key);

  @override
  State<AddCouponsPage> createState() => _AddCouponspagrState();

}

class _AddCouponspagrState extends State<AddCouponsPage> {
  final _formKey = GlobalKey<FormState>();
  String selectedCoupons="";
  String couponsChoose= "";
  String dropdownValue = 'Flat';
  String labelDiscount="Flat";

  DateTime startDate =DateTime.now();
  DateTime endDate =DateTime.now();
   String startDateAndTime ="";
   String endDateAndTime="";

  TextEditingController propertyController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController couponController = TextEditingController();



  @override
  void initState() {
    setState(() {

      startDateAndTime = DateFormat('dd-MM-yyyy').format(startDate);
      endDateAndTime =  DateFormat('dd-MM-yyyy').format(endDate);
    });
  }

  @override
  Widget build(BuildContext context) {

    propertyController.text = Constants.PROPERTY_NAME.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
            height: Dimensions.size50),

      ),

      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.size20,vertical: Dimensions.size20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Coupons",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height:  Dimensions.size20,
                  ),


                  TextFormField(
                    // controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter property !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Property',
                    ),
                    controller: propertyController,
                    //  controller: myController,
                  ),
                  //city
                  SizedBox(
                    height:  Dimensions.size20,
                  ),


                  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;

                      });
                    },
                    items: <String>['Flat', 'Percentage' ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),

                      );
                    }).toList(),
                  ),


                  SizedBox(
                    height:  Dimensions.size20,
                  ),

                  TextFormField(
                    controller: discountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Percentage !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: dropdownValue,

                    ),
                    // controller: myController,
                  ),

                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  TextFormField(
                    controller: couponController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Coupon Code !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter Coupon Code",

                    ),
                    // controller: myController,
                  ),

                  SizedBox(
                    height:  Dimensions.size20,
                  ),


                  Text(
                    "Start From",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.lightBlueAccent[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  Row(
                    children: [

                      Text(
                        startDateAndTime,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: new Icon(Icons.calendar_today_outlined), onPressed: () {
                        DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime:  DateTime.now(),

                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {

                             startDateAndTime=DateFormat('dd-MM-yyyy').format(date);
                            });
                          }, );
                      },
                      ) ,
                    ],
                  ),


                  Text(
                    "Valid to",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.lightBlueAccent[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  Row(
                    children: [
                      Text(
                        endDateAndTime,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: new Icon(Icons.calendar_today_outlined), onPressed: () {
                        DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime:  DateTime.now(),
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              endDateAndTime=DateFormat('dd-MM-yyyy').format(date);
                            });
                          }, );
                      },
                      ) ,
                    ],
                  ),

                  SizedBox(
                    height:  Dimensions.size20,
                  ),

                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            // addAddress();
                            addCoupon();

                          },
                          child: Text('SAVE'),
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                          ),
                        ),
                      ],
                    ),
                  ),

                ]),
          ),
        ),
      ),

    );
  }

  void addCoupon() {

    if(discountController.text.isEmpty || couponController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Some data missing, check correctly !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }else{
      Get.find<MenuBusinessController>().getMenuAddCouponResult(dropdownValue,discountController.text,couponController.text
      ,startDateAndTime,endDateAndTime);

    }

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';
class AddOffersPage extends StatefulWidget {
  const AddOffersPage({Key? key}) : super(key: key);

  @override
  State<AddOffersPage> createState() => _AddOffersPageState();

}

class _AddOffersPageState extends State<AddOffersPage> {

  final _formKey = GlobalKey<FormState>();
  String selectedOffer="";
  String offerChoose= "";
  String dropdownValue = 'Flat';

  @override
  void initState() {
    // TODO: implement initState
    String date = "";
    super.initState();
  }

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
                    "Offers",
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
                    items: <String>['Flat', 'percentage' ]
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
                    //controller: stateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Percentage !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Percentage',

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
                        DateTime.now().toString(),
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
                        DateTime.now().toString(),
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
}

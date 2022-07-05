import 'package:businesspartner/controllers/BusinessController/MenuBusinessController.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';
class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();

}



class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipController = TextEditingController();


  @override
  void initState() {
    addressController.text = (Constants.AADDRESS ?? "")!;
    cityController.text = (Constants.ACITY ?? "")!;
    stateController.text = (Constants.ASTATE ?? "")!;
    countryController.text = (Constants.ACOUNTRY ?? "")!;
    zipController.text = (Constants.APINCODE ?? "")!;

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
                    "Address",
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

                  //address
                  TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter address !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Address',
                    ),
                    //  controller: myController,
                  ),
                  //city
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  TextFormField(
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter city !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'City',

                    ),
                    // controller: myController,
                  ),

                  //state
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  TextFormField(
                    controller: stateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter state !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'state',

                    ),
                    // controller: myController,
                  ),

                  //country
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  TextFormField(
                    controller: countryController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter country !';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Country',

                    ),
                    // controller: myController,
                  ),


                  //zip
                  SizedBox(
                    height:  Dimensions.size20,
                  ),
                  TextFormField(

                    controller: zipController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Zip !';
                      }
                      return null;
                    },

                    // inputFormatters: [ FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly,],

                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Zip',

                    ),
                    // controller: myController,
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

                            addAddress();

                          },
                          child: Text('SUBMIT'),
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

  void addAddress() {

    if (_formKey.currentState!.validate()) {

      Get.find<MenuBusinessController>().getMenuAddAddressResult(addressController.text, cityController.text
          , countryController.text, addressController.text, zipController.text);
        // Fluttertoast.showToast(
        //     msg: "Submited ",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        //ScaffoldMessenger.of(context).showSnackBar(
        //  const SnackBar(content: Text('Check Data error...')),


    }else {
    Fluttertoast.showToast(
    msg: "Check Data error...!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.orange,
    textColor: Colors.white,
    fontSize: 16.0);

    //ScaffoldMessenger.of(context).showSnackBar(
    //  const SnackBar(content: Text('Check Data error...')),

    }

  }
}

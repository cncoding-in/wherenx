import 'package:businesspartner/controllers/BusinessController/CreateBusinessController.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../controllers/AuthController/forgot_password_controller.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}




class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  String entredOtp="";
  late String  password , cnfpassword;

  final passwordController = TextEditingController();
  final cnfpasswordController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  final _formKey = GlobalKey<FormState>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: 200.0,
          width: 150.0,
        ),
      ),
      body:
      Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "What is the code ?",
                            // style: TextStyle(fontWeight: FontWeight.bold),
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sent to your mail",
                            textAlign: TextAlign.center,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                        height: 100,
                        child: OTPTextField(
                          length: 5,
                          fieldWidth: 40,
                          style: TextStyle(
                              fontSize: 20
                          ),

                          fieldStyle: FieldStyle.box,
                          onChanged: (pin) {
                            entredOtp= pin;
                            print("Completed: " + pin);
                          },
                          onCompleted: (pin) {
                            entredOtp= pin;
                            print("Completed: " + pin);
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter new password !';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Password',

                        ),
                        // controller: myController,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter new confirm password !';
                          }
                          return null;
                        },
                        controller: cnfpasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Conform Password',

                        ),
                        // controller: myController,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {

                                VerifyPassword();

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

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(
                              "Resend OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void VerifyPassword() {
    if (entredOtp != "") {
      if (entredOtp.length <= 4) {
        print("error");
      } else {
        print(entredOtp);
        print(passwordController.text);
        if (_formKey.currentState!.validate()) {

          if (passwordController.text == cnfpasswordController.text) {
            print("Password success");
            Get.find<ForgotPasswordController>().getVerifyPasswordGetResult(box.read(Constants.OTPID).toString(),box.read(Constants.OTP).toString(),passwordController.text);
          } else {
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
    } else {
      print("Failed");
      Fluttertoast.showToast(
          msg: "Failed, check correctly !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    //Get.find<ForgotPasswordController>().getVerifyPasswordGetResult(box.read(Constants.OTPID).toString(),box.read(Constants.OTP).toString(),"wherenx@123");
  }
}

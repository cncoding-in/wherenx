import 'package:businesspartner/controllers/AuthController/auth_controller.dart';
import 'package:businesspartner/controllers/AuthController/forgot_password_controller.dart';
import 'package:businesspartner/helper/constants.dart';
import 'package:businesspartner/pages/Helper/Loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();

}

class _AuthLoginPageState extends State<AuthLoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey_email = new GlobalKey();
  GlobalKey<FormState> formKey_pass = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image(
                      width: 200,
                      image:
                      AssetImage('assets/images/ic_wherenx_logo_large.png')),
                ]),
                SizedBox(
                  height: 20,
                ),
                // Form(
                //   key: formKey,
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        // style: TextStyle(fontWeight: FontWeight.bold),
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ///email
                      Form(
                        key: formKey_email,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Email !';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            //  validator: (value) => value.isEmpty ? 'Email cannot be blank' : null,
                          ),
                          //  controller: myController,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //password
                      Form(
                        key: formKey_pass,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password !';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',

                          ),
                          // controller: myController,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //forgot password
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "Forget password",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              forgotPassword();
                            },
                          ),
                        ],
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
                                loginNow();
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                minimumSize:
                                Size(MediaQuery.of(context).size.width, 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                //)
              ],
            ),
          ),
        ),
      ),
    );

  }

  void loginNow() {

    if (formKey_email.currentState!.validate()||formKey_pass.currentState!.validate()) {

      if(passwordController.text.isEmpty || emailController.text.isEmail )
      {
        print("Password success");
        print(passwordController.text);
        print(emailController.text);
        Get.find<AuthController>().getLoginResult(emailController.text,passwordController.text);

      }
      else {
        print(passwordController.text);
        print(emailController.text);

        Fluttertoast.showToast(
            msg: "Failed, check correctly !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);

      }
    }
    else {
      print(passwordController.text);
      print(emailController.text);

      Fluttertoast.showToast(
          msg: "Failed, check correctly !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);

    }

   // Get.find<AuthController>().getLoginResult("mondalbidyut38@gmail.com", "123456");

  }


  void forgotPassword() {
    if( formKey_email.currentState!.validate()){
      if(emailController.text.isEmail ){


        Constants.CPEMAIL = emailController.text;
       var response = Get.find<ForgotPasswordController>().getForgotPasswordGetResult(emailController.text,false);

      }else{

        Fluttertoast.showToast(
            msg: "Enter valid email !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }else{

    }



  }
}

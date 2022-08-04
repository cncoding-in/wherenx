import 'package:shared_preferences/shared_preferences.dart';

class Constants {

  static const String APP_NAME = "WhereNx";
  static const int APP_VERSION = 1;

  static const String userLocation ="";
  static String USERIDDATA = "";
  //static const String BASE_URL = "https://www.2designnerds.com/wherenx/public/api/businesspartner/";
  static const String BASE_URL = "https://www.2designnerds.com/wherenx/public/api/";
  static const String TOKEN = "token";
  static const String LOGIN = "login";
  static const String FORGOTPASSWORDGET = "forgot-password?email=";
  static const String VERIFYPASSWORD = "verify-password";
  static const String CREATEBUSINESS = "creat-business";
  static const String BUSINESSDETAILS = "business-details?";
  static const String GETBUSINESSLIST = "get-business-list?owner_id=";
  static const String PINNEDPROPERTY = "pinned-property-marker?latitude=20.3413076&longitude=85.8033065&key_word=bar";

  //authentication details
  static const String LOGINSTATUS = "0";

  // Obtain shared preferences.
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setBool('repeat', true);

  // user login details

  static const String OWNERID = "owner_id";
  static const String NAME = "name";
  static const String EMAIL = "email";
  static const String PHOFILEPHOTO = "profile_photo";
  static const String ADDRESS = "address";
  static const String GENDER = "gender";
  static const String AGE = "age";
  static const String PINCODE = "pincode";

  //Forgot Password
  static const String OTP = "otp";
  static const String OTPID = "otpid";



}


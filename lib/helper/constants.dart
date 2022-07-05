import 'package:shared_preferences/shared_preferences.dart';

class Constants {

  static const String APP_NAME = "WhereNx";
  static const int APP_VERSION = 1;

  static const String userLocation ="";
  static String USERIDDATA = "";
  static const String BASE_URL = "https://www.2designnerds.com/wherenx/public/api/";
  static const String TOKEN = "token";
  static const String LOGIN = "business/login";
  static const String FORGOTPASSWORDGET = "business/forgot-password?email=";
  static const String VERIFYPASSWORD = "business/verify-password";
  static const String CREATEBUSINESS = "businesspartner/creat-business";
  static const String BUSINESSDETAILS = "businesspartner/business-details?";
  static const String GETBUSINESSLIST = "businesspartner/get-business-list?owner_id=";

  static const String GETBUSINESSDETAILS = "businesspartner/business-details?";
  static const String BUSINESSDETAILSSAVE = "businesspartner/business-details";
  static const String MENUBUSINESSLOCATION = "businesspartner/business-location?";
  static const String MENUBUSINESSLOCATIONPOST = "businesspartner/business-location";

  static const String MENUCOUPONSGET = "businesspartner/business-coupon?";
  static const String MENUCOUPONSPOST = "businesspartner/business-coupon";



  //authentication details
  static const String LOGINSTATUS = "0";

  // Obtain shared preferences.
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setBool('repeat', true);

  // user login details

  static const String OWNERID = "owner_id";
  static const String NAME = "name";
  static const String EMAIL = "email";
  static const String PROFILEPHOTO = "profile_photo";
  static const String ADDRESS = "address";
  static const String GENDER = "gender";
  static const String AGE = "age";
  static const String PINCODE = "pincode";

  //Forgot Password
  static  String OTP = "otp";
  static  String OTPID = "otpid";

  //Coupon
  static  String COUPONID = "";


// For app help

  static String OWNERID_DATA="";
  static String PROPERTY_NAME="";


  // For menu items
  static String MENU_BUSINESS_INDEX = "";
  static String MENU_BUSINESS_ID = "";
  static String MENU_BUSINESS_NAME = "";





}


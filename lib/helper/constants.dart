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
  static const String BUSINESSDELETE = "businesspartner/delete-business?";
  static const String BUSINESSSTATUS = "businesspartner/update-business-status?";

  static const String GETBUSINESSDETAILS = "businesspartner/business-details?";
  static const String BUSINESSDETAILSSAVE = "businesspartner/business-details";
  static const String MENUBUSINESSLOCATION = "businesspartner/business-location?";
  static const String MENUBUSINESSLOCATIONPOST = "businesspartner/business-location";

  static const String MENUCOUPONSGET = "businesspartner/business-coupon?";
  static const String MENUCOUPONSPOST = "businesspartner/business-coupon";

  static const String MENUGETADDRESS = "businesspartner/business-address?";
  static const String MENUADDADDRESS = "businesspartner/business-address";

  static const String MENUMEDIA = "businesspartner/add-media?";
  static const String MENUUPLOADMEDIA = "businesspartner/add-media";
  static const String MENUDELETEMEDIA = "businesspartner/delete-media?image_id=";

  static const String MENUOFFER = "businesspartner/business-offers?";
  static const String MENUADDOFFER = "businesspartner/business-offers";


  //authentication details
  static const String LOGINSTATUS = "0";

  // Obtain shared preferences.
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setBool('repeat', true);

  // user login details



  static String CPEMAIL = "";
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

  //Media
  static  String MEDIAID = "";

  //Address
  static  String ASTATE = "";
  static  String ACITY = "";
  static  String ACOUNTRY = "";
  static  String AADDRESS  = "";
  static  String APINCODE  = "";

// For app help

  static String OWNERID_DATA="";
  static String PROPERTY_NAME="";


  // For menu items
  static String MENU_BUSINESS_INDEX = "";
  static String MENU_BUSINESS_ID = "";
  static String MENU_BUSINESS_NAME = "";





}


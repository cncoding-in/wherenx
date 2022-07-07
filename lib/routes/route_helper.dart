import 'package:businesspartner/pages/Authentication/AuthLoginPage.dart';
import 'package:businesspartner/pages/Authentication/ForgotPasswordPage.dart';
import 'package:businesspartner/pages/MenuItems/AddCouponsPage.dart';
import 'package:businesspartner/pages/MenuItems/AddOffersPage.dart';

import 'package:businesspartner/pages/MenuItems/AllMenu.dart';

import 'package:businesspartner/pages/Business/CreateBusiness.dart';
import 'package:businesspartner/pages/Business/Dashboard.dart';
import 'package:businesspartner/pages/MenuItems/LocationPage.dart';
import 'package:businesspartner/pages/MenuItems/MediaPage.dart';


import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/Authentication/AppSplashPage.dart';
import '../pages/MenuItems/AddressPage.dart';
import '../pages/MenuItems/BusinessDetails.dart';
import '../pages/MenuItems/BusinessHoursPage.dart';
import '../pages/MenuItems/CouponsPage.dart';

import '../pages/MenuItems/OffersPage.dart';
import '../pages/MenuItems/UploadMedia.dart';



class RouteHelper{
  static const String initial = "/";
  static const String authlogInPage = "/auth-login-page";
  static const String authForgotPasswordPage = "/auth-forgot-password-page";
  static const String createBusinessPage = "/create-business-page";
  static const String dashboard = "/dashboard-page";
  static const String allMenu = "/all-menu-page";
  static const String couponsPage = "/coupons-page";
  static const String offerPage = "/offer-page";
  static const String mediaPage = "/media-page";
  static const String addressPage = "/address-page";
  static const String addOffersPage = "/add-offer-page";
  static const String menuDetailsPage = "/business-details-page";

  static const String uploadMediaPage= "/upload-media-page";
  static const String addCouponsPage= "/add-coupons-page";
  static const String businessHoursPage= "/business-hours-page";
  static const String locationPage= "/location-page";



  static String getInitial()=> '$initial';
  static String getAuthLoginPage()=> '$authlogInPage';
  static String getAuthForgotPasswordGetPage()=> '$authForgotPasswordPage';
  static String getCreateBusinessPage()=> '$createBusinessPage';
  static String getDashboardPage()=> '$dashboard';
  static String getAllMenu()=> '$allMenu';
  static String getCouponsPage()=> '$couponsPage';
  static String getOfferPage()=> '$offerPage';
  static String getMediaPage()=> '$mediaPage';
  static String getAddressPage()=> '$addressPage';
  static String getAddOffersPage()=> '$addOffersPage';
  static String getUploadMediaPage()=> '$uploadMediaPage';
  static String getAddCouponsPage()=> '$addCouponsPage';
  static String getBusinessHoursPage()=> '$businessHoursPage';
  static String getLocationPage()=> '$locationPage';
  static String getMenuDetailsPage()=> '$menuDetailsPage';


  static List<GetPage> routes = [
    // Get Initial Page
    GetPage(name: initial, page: (){
      return AppSplashPage();
    },
        transition: Transition.zoom
    ),

    // Get Auth Login Page
    GetPage(name: authlogInPage, page: (){
      return AuthLoginPage();
    },
        transition: Transition.fadeIn
    ),

    // Get Auth Forgot Password Page
    GetPage(name: authForgotPasswordPage, page: (){
      return ForgotPasswordPage();
    },
        transition: Transition.zoom
    ),

    //Create business page
    GetPage(name: createBusinessPage, page: (){
      return CreateBusiness();
    },
        transition: Transition.zoom
    ),


    //Dashboard page
    GetPage(name: dashboard, page: (){
      return const Dashboard();
    },
        transition: Transition.zoom
    ),

    //Menu Details page
    GetPage(name: menuDetailsPage, page: (){
      return const BusinessDetails();
    },
        transition: Transition.zoom
    ),

    GetPage(name: allMenu, page: (){
      return const AllMenu();
    },
        transition: Transition.zoom
    ),


    GetPage(name: couponsPage, page: (){
      return const CouponsPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: mediaPage, page: (){
      return const MediaPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: offerPage, page: (){
      return OfferPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: allMenu, page: (){
      return AllMenu();
    },
        transition: Transition.zoom
    ),
    // GetPage(name: mediaPage, page: (){
    //   return MediaPage();
    // },
    //     transition: Transition.zoom
    // ),

    GetPage(name: addressPage, page: (){
      return const AddressPage();
    },
        transition: Transition.zoom
    ),


    GetPage(name: addOffersPage, page: (){
      return AddOffersPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: uploadMediaPage, page: (){
      return Uploadmedia();
    },
        transition: Transition.zoom
    ),

    GetPage(name: addCouponsPage, page: (){
      return AddCouponsPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: businessHoursPage, page: (){
      return BusinessHoursPage();
    },
        transition: Transition.zoom
    ),

    GetPage(name: locationPage, page: (){
      return LocationPage();
    },
        transition: Transition.zoom
    ),


  ];


}
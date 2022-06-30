import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   // TODO: Add your Google Maps API key
   GMSServices.provideAPIKey("AIzaSyCWppOr_-vSi57hd8LdRlAggbeHzMu4sMA")
    GeneratedPluginRegistrant.register(with: self)



    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

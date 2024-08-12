import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @discardableResult
  override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {

      if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
          if let webpageURL = userActivity.webpageURL {
              print("Received Universal Link: \(webpageURL)")
              // You may want to handle the URL here, e.g., navigate to a specific page in your Flutter app
              return true
          }
      }

      return false
  }
}

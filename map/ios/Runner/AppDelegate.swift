import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
       // Flutter에서 API 키를 전달받기 위한 MethodChannel 설정
    let controller = window?.rootViewController as! FlutterViewController
    let apiKeyChannel = FlutterMethodChannel(name: "com.example.map/apiKey", binaryMessenger: controller.binaryMessenger)
    
    // MethodChannel에서 'setApiKey' 호출을 수신하고, API 키를 설정
    apiKeyChannel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
      if call.method == "setApiKey" {
        if let apiKey = call.arguments as? String {
          GMSServices.provideAPIKey(apiKey)
          result(nil) // 성공적으로 설정되었음을 알림
        } else {
          result(FlutterError(code: "INVALID_API_KEY", message: "API Key is invalid", details: nil))
        }
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

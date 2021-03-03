import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
   batteryChannel.setMethodCallHandler({
     [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
     // Note: this method is invoked on the UI thread.

     if (call.method == "getBatteryLevel")
     {
          self?.receiveBatteryLevel(result: result)
     }
      else if (call.method == "getName") {
                 self?.receiveName(result: result)
               }
     else {
       result(FlutterMethodNotImplemented)
       return
     }

   })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


private func receiveBatteryLevel(result: FlutterResult) {
  let device = UIDevice.current
  device.isBatteryMonitoringEnabled = true
  if device.batteryState == UIDevice.BatteryState.unknown {
    result(FlutterError(code: "UNAVAILABLE",
                        message: "Battery info unavailable",
                        details: nil))
  } else {
    result(Int(device.batteryLevel * 100))
  }
}

private func receiveName(result: FlutterResult) {
  let name = "Kadriye"

  result(name)
}

}

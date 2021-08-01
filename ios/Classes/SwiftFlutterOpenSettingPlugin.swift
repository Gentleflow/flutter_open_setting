import Flutter
import UIKit

public class SwiftFlutterOpenSettingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_open_setting", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOpenSettingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "open_setting"){
        openSettings()
    }
  }
    
  private func openSettings() {
        if let url = URL(string: "App-Prefs:root=General") {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
      }
  }
}

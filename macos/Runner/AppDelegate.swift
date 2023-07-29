import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCq7hlabnqxQyrP2xPUlRMycNZR1eWQZmc")
    return true
  }
}

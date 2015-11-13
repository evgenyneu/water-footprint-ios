import UIKit
@testable import WaterFootprint

struct TestHelpers {
  static func initViewController() -> ViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    return storyboard.instantiateInitialViewController() as? ViewController
  }
}
import UIKit
@testable import WaterFootprint

struct TestHelpers {
  static func initViewController() -> ListViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    return storyboard.instantiateInitialViewController() as? ListViewController
  }
}
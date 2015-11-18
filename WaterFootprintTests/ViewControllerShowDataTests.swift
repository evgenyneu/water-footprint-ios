
import XCTest
@testable import WaterFootprint

class ViewControllerShowDataTests: XCTestCase {
  var viewController: ViewController!
  
  var tableView: UITableView {
    return viewController.tableViewObject.tableView
  }
  
  override func setUp() {
    super.setUp()
    
    viewController = TestHelpers.initViewController()
  }
  
  override func tearDown() {
    super.tearDown()
    
    viewController.endAppearanceTransition()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testShowDataEnglish() {
    DataLanguage._currentLanguageCode = "en"
    viewController.beginAppearanceTransition(true, animated: false)
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(234, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 145, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Orange juice", tableViewCell?.productLabel.text)
    XCTAssertEqual("1,018", tableViewCell?.waterLitresLabel.text)
  }
  
  func testShowDataChinese() {
    DataLanguage._currentLanguageCode = "zh"
    viewController.beginAppearanceTransition(true, animated: false)
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(234, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 145, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("荞麦", tableViewCell?.productLabel.text)
    XCTAssertEqual("3,142", tableViewCell?.waterLitresLabel.text)
  }

}
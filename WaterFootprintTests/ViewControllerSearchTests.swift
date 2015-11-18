
import XCTest
@testable import WaterFootprint

class ViewControllerSearchTests: XCTestCase {
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
  
  func testSearchEnglish() {
    DataLanguage._currentLanguageCode = "en"
    viewController.beginAppearanceTransition(true, animated: false)

    viewController.searchBarObject.didSearch?("Meat")
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(5, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Beef", tableViewCell?.productLabel.text)
  }
  
  func testSearchChinese() {
    DataLanguage._currentLanguageCode = "en"
    viewController.beginAppearanceTransition(true, animated: false)
    
    viewController.searchBarObject.didSearch?("Meat")
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(5, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Beef", tableViewCell?.productLabel.text)
  }
}

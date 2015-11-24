import XCTest
@testable import WaterFootprint

class JapaneseListViewControllerTests: XCTestCase {
  var viewController: ListViewController!
  
  var tableView: UITableView {
    return viewController.tableViewObject.tableView
  }
  
  override func setUp() {
    super.setUp()
    
    viewController = TestHelpers.initViewController()
    DataLanguage._currentLanguageCode = "ja"
    viewController.beginAppearanceTransition(true, animated: false)
  }
  
  override func tearDown() {
    super.tearDown()
    
    viewController.endAppearanceTransition()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testShowData() {
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(231, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 145, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("トマト（皮なし）", tableViewCell?.productLabel.text)
    XCTAssertEqual("267", tableViewCell?.waterLitresLabel.text)
  }
  
  func testSearch() {
    viewController.searchBarObject.didSearch?("向日")
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(2, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("ヒマワリ（種子）", tableViewCell?.productLabel.text)
  }
}
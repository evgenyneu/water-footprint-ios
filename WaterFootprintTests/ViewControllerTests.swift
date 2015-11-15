import XCTest
@testable import WaterFootprint

class ViewControllerTests: XCTestCase {
  
  var viewController: ViewController!
  
  var tableView: UITableView {
    return viewController.tableViewObject.tableView
  }
  
  override func setUp() {
    super.setUp()
    
    viewController = TestHelpers.initViewController()
    viewController.beginAppearanceTransition(true, animated: false)
  }
  
  override func tearDown() {
    super.tearDown()
    
    viewController.endAppearanceTransition()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testShowData() {
    DataLanguage._currentLanguageCode = "en"
    
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
  
  // MARK: - Search
  
  func testSearch() {
    DataLanguage._currentLanguageCode = "en"
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
  
  func testSearch_emptySearchText() {
    DataLanguage._currentLanguageCode = "en"
    viewController.searchBarObject.didSearch?("")
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(234, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Abaca fibre", tableViewCell?.productLabel.text)
  }
}

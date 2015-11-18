import XCTest
@testable import WaterFootprint

class ListViewControllerTests: XCTestCase {
  
  var viewController: ListViewController!
  
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
  
  // MARK: - Search
  
  func testSearch_emptySearchText() {
    DataLanguage._currentLanguageCode = "en"
    viewController.searchBarObject.didSearch?("")
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(235, numberOfRows)
    
    // Show cell
    // ----------
    
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    let tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Abaca fibre", tableViewCell?.productLabel.text)
  }
}

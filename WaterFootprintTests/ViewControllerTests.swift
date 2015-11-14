import XCTest
@testable import WaterFootprint

class ViewControllerTests: XCTestCase {
  
  var models = [ProductModel]()
  var viewController: ViewController!
  
  var tableView: UITableView {
    return viewController.tableViewObject.tableView
  }
  
  override func setUp() {
    super.setUp()
    
    models = [ProductModel]()
    models.append(ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415))
    models.append(ProductModel(name: "Cheese", synonyms: "", waterLitres: 5060))
    
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
}

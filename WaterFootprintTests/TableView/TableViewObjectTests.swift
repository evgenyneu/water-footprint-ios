
import XCTest
@testable import WaterFootprint

class TableViewObjectTests: XCTestCase {
  var models = [ProductModel]()
  var viewController: ListViewController!
  
  var tableView: UITableView { return viewController.tableViewObject.tableView }
  var obj: TableViewObject { return viewController.tableViewObject }
  
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
  }
  
  func testShowData_numberOfRows() {
    obj.showData(models)
    
    let numberOfRows = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(2, numberOfRows)
  }
  
  func testShowData_showContentInCell() {
    obj.showData(models)
    
    // Row one
    // -------------
    
    var indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    var tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Beef", tableViewCell?.productLabel.text)
    XCTAssertEqual("15,415", tableViewCell?.waterLitresLabel.text)
    
    // Row two
    // -------------
    
    indexPath = NSIndexPath(forRow: 1, inSection: 0)
    
    tableViewCell = tableView.dataSource?.tableView(tableView, cellForRowAtIndexPath: indexPath)
      as? TableViewCell
    
    XCTAssertEqual("Cheese", tableViewCell?.productLabel.text)
    XCTAssertEqual("5,060", tableViewCell?.waterLitresLabel.text)
  }
}
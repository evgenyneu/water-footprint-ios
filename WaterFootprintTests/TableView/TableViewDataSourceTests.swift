import XCTest
@testable import WaterFootprint

class TableViewDataSourceTests: XCTestCase {
  
  var obj: TableViewDataSource!
  var models = [ProductModel]()
  var viewController: ListViewController!
  
  var tableView: UITableView {
    return viewController.tableViewObject.tableView
  }
  
  override func setUp() {
    super.setUp()
    
    models = [ProductModel]()
    models.append(ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415))
    models.append(ProductModel(name: "Cheese", synonyms: "", waterLitres: 5060))
    
    obj = TableViewDataSource(models: models)
    
    viewController = TestHelpers.initViewController()
    viewController.beginAppearanceTransition(true, animated: false)
  }
  
  override func tearDown() {
    super.tearDown()
    
    viewController.endAppearanceTransition()
  }
  
  func testNumberOfRows() {
    let result = obj.tableView(tableView, numberOfRowsInSection: 0)
    
    XCTAssertEqual(2, result)
  }
  
  func testGetCell() {
    let indexPath = NSIndexPath(forRow: 1, inSection: 0)
    let result = obj.tableView(tableView, cellForRowAtIndexPath: indexPath) as? TableViewCell
    
    XCTAssertEqual("Cheese", result?.productLabel.text)
    XCTAssertEqual("5,060", result?.waterLitresLabel.text)
  }
  
  // MARK: - Model at row
  
  func testModelAtRow() {
    let result = obj.modelAtRow(0)
    XCTAssertEqual("Beef", result?.name)
  }
  
  func testModelAtRowNil() {
    let result = obj.modelAtRow(345)
    XCTAssert(result == nil)
  }
}

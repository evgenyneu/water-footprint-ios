import XCTest
@testable import WaterFootprint

class TableViewDataSourceTests: XCTestCase {
  
  var obj: TableViewDataSource!
  var models = [ProductModel]()
  var viewController: ViewController!
  
  override func setUp() {
    super.setUp()
    
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
  }
}

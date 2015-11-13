import XCTest
@testable import WaterFootprint

class TableViewCellTests: XCTestCase {
  var obj: TableViewCell!
  
  override func setUp() {
    super.setUp()
    
    obj = TableViewCell()
  }
  
  func testShowModel() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    obj.showModel(model)
  }
}

import XCTest
@testable import WaterFootprint

class TableViewCellTests: XCTestCase {
  var obj: TableViewCell!
  var productLabel: UILabel!
  var waterLitresLabel: UILabel!
  
  override func setUp() {
    super.setUp()
    
    productLabel = UILabel()
    waterLitresLabel = UILabel()

    obj = TableViewCell()
    
    obj.productLabel = productLabel
    obj.waterLitresLabel = waterLitresLabel
  }
  
  func testShowModel() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    obj.showModel(model)
    
    XCTAssertEqual("Beef", productLabel.text)
    XCTAssertEqual("15,415", waterLitresLabel.text)
  }
}

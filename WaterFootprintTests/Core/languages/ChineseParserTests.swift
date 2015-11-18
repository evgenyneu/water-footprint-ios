import XCTest
@testable import WaterFootprint

class ChineseParserTests: XCTestCase {
  let languageCode = "zh"
  
  override func tearDown() {
    super.tearDown()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testReadAndParse() {
    let result = DataParser.readAndParse(languageCode)
    
    XCTAssertEqual(234, result.count)
    
    let first = result.first!
    XCTAssertEqual("八角", first.name)
    XCTAssertEqual("茴香，茴芹，大茴香", first.synonyms)
    XCTAssertEqual(8280, first.waterLitres)
    
    let middle = result[19]
    XCTAssertEqual("橙汁", middle.name)
    XCTAssertEqual("橘汁", middle.synonyms)
    XCTAssertEqual(1018, middle.waterLitres)
    
    let last = result.last!
    XCTAssertEqual("棕榈油", last.name)
    XCTAssertEqual("", last.synonyms)
    XCTAssertEqual(4971, last.waterLitres)
  }
  
  func testCheckTextTrimmed() {
    let result = DataParser.readAndParse(languageCode)
    
    for model in result {
      XCTAssertEqual(model.name, WaterString.trim(model.name))
      XCTAssertEqual(model.synonyms, WaterString.trim(model.synonyms))
    }
  }

}


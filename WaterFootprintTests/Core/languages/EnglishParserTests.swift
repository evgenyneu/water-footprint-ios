import XCTest
@testable import WaterFootprint

class EnglishParserTests: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testReadAndParse() {
    let result = DataParser.readAndParse("en")
    
    XCTAssertEqual(234, result.count)
    
    let first = result.first!
    XCTAssertEqual("Abaca fibre", first.name)
    XCTAssertEqual("", first.synonyms)
    XCTAssertEqual(22654, first.waterLitres)
    
    let middle = result[19]
    XCTAssertEqual("Beef", middle.name)
    XCTAssertEqual("Cow meat, steak", middle.synonyms)
    XCTAssertEqual(15415, middle.waterLitres)
    
    let last = result.last!
    XCTAssertEqual("Yams", last.name)
    XCTAssertEqual("", last.synonyms)
    XCTAssertEqual(343, last.waterLitres)
  }
}


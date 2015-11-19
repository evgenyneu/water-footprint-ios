import XCTest
@testable import WaterFootprint

class JapaneseParserTests: XCTestCase {
  let languageCode = "ja"
  
  override func tearDown() {
    super.tearDown()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testReadAndParse() {
    let result = DataParser.readAndParse(languageCode)
    
    XCTAssertEqual(233, result.count)
    
    let first = result.first!
    XCTAssertEqual("アーティチョーク", first.name)
    XCTAssertEqual("", first.synonyms)
    XCTAssertEqual(818, first.waterLitres)
    
    let middle = result[19]
    XCTAssertEqual("オオバコ", middle.name)
    XCTAssertEqual("大葉子", middle.synonyms)
    XCTAssertEqual(1602, middle.waterLitres)
    
    let last = result.last!
    XCTAssertEqual("麻繊維", last.name)
    XCTAssertEqual("", last.synonyms)
    XCTAssertEqual(2447, last.waterLitres)
  }
  
  func testCheckTextTrimmed() {
    let result = DataParser.readAndParse(languageCode)
    
    for model in result {
      XCTAssertEqual(model.name, WaterString.trim(model.name))
      XCTAssertEqual(model.synonyms, WaterString.trim(model.synonyms))
    }
  }
}



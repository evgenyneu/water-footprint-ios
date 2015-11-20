import XCTest
@testable import WaterFootprint

class RussianParserTests: XCTestCase {
  let languageCode = "ru"
  
  override func tearDown() {
    super.tearDown()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testReadAndParse() {
    let result = DataParser.readAndParse(languageCode)
    
    XCTAssertEqual(231, result.count)
    
    let first = result.first!
    XCTAssertEqual("Абака, волокно", first.name)
    XCTAssertEqual("", first.synonyms)
    XCTAssertEqual(22654, first.waterLitres)
    
    let middle = result[18]
    XCTAssertEqual("Баранина", middle.name)
    XCTAssertEqual("Мясо овец, ягнятина", middle.synonyms)
    XCTAssertEqual(10412, middle.waterLitres)
    
    let last = result.last!
    XCTAssertEqual("Ячмень", last.name)
    XCTAssertEqual("", last.synonyms)
    XCTAssertEqual(1423, last.waterLitres)
  }
  
  func testCheckTextTrimmed() {
    let result = DataParser.readAndParse(languageCode)
    
    for model in result {
      XCTAssertEqual(model.name, WaterString.trim(model.name))
      XCTAssertEqual(model.synonyms, WaterString.trim(model.synonyms))
    }
  }
}



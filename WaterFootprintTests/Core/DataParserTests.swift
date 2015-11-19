
import XCTest
@testable import WaterFootprint

class DataParserTests: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    DataLanguage._currentLanguageCode = nil
  }
  
  func testFileName() {
    XCTAssertEqual("data_en.tsv", DataReader.fileName("en"))
    XCTAssertEqual("data_ja.tsv", DataReader.fileName("ja"))
  }
  
  func testParse() {
    let result = DataParser.parse("one\t11\t111\r\ntwo\t22\t222")
    
    XCTAssertEqual(2, result.count)
    
    let productOne = result[0]
    XCTAssertEqual("one", productOne.name)
    XCTAssertEqual("11", productOne.synonyms)
    XCTAssertEqual(111, productOne.waterLitres)
    
    let productTwo = result[1]
    XCTAssertEqual("two", productTwo.name)
    XCTAssertEqual("22", productTwo.synonyms)
    XCTAssertEqual(222, productTwo.waterLitres)
  }
  
  func testReadAndParseForCurrentLanguage() {
    DataLanguage._currentLanguageCode = "en"
    let result = DataParser.readAndParseForCurrentLanguage()
    
    XCTAssertEqual(234, result.count)
    XCTAssertEqual("Abaca fibre", result.first?.name)
  }
  
  func testReadAndParseForCurrentLanguageCached() {
    DataLanguage._currentLanguageCode = "en"
    var result = DataParser.readAndParseForCurrentLanguageCached()
    
    DataLanguage._currentLanguageCode = "zh"
    result = DataParser.readAndParseForCurrentLanguageCached()
    
    XCTAssertEqual(234, result.count)
    XCTAssertEqual("Abaca fibre", result.first?.name)
  }
}

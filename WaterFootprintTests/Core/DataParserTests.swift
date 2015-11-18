
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
  
  func testReadAndParseEnglish() {
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
  
  func testReadAndParseChinese() {
    let result = DataParser.readAndParse("zh")
    
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

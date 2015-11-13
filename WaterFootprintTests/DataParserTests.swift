
import XCTest
@testable import WaterFootprint

class DataParserTests: XCTestCase {
  func testFileName() {
    XCTAssertEqual("data_en.tsv", DataReader.fileName("en"))
    XCTAssertEqual("data_ja.tsv", DataReader.fileName("ja"))
  }
  
  func testParse() {
    let result = DataParser.parse("one\t11\t111\ntwo\t22\t222")
    
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
    let tick = TickTock()
    let result = DataParser.readAndParse("en")
    tick.output()
    
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

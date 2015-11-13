import XCTest
@testable import WaterFootprint

class DataReaderTests: XCTestCase {
  
  func testFileName() {
    XCTAssertEqual("data_en.tsv", DataReader.fileName("en"))
    XCTAssertEqual("data_ja.tsv", DataReader.fileName("ja"))
  }
  
  func testReadForLanguage() {
    let result = DataReader.read("en")
    
    let range = Range<String.Index>(start: result.startIndex, end: result.startIndex.advancedBy(11))
    let substring = result.substringWithRange(range)
    XCTAssertEqual("Abaca fibre", substring)
  }
}

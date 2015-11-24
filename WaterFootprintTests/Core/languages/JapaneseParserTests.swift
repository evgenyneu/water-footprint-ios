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
    
    XCTAssertEqual(231, result.count)
    
    let first = result.first!
    XCTAssertEqual("アーティチョーク", first.name)
    XCTAssertEqual("", first.synonyms)
    XCTAssertEqual(818, first.waterLitres)
    
    let middle = result[19]
    XCTAssertEqual("エンドウ豆（乾燥）", middle.name)
    XCTAssertEqual("えんどう豆,えんどうまめ,エンドウマメ", middle.synonyms)
    XCTAssertEqual(1979, middle.waterLitres)
    
    let last = result.last!
    XCTAssertEqual("綿（リント）", last.name)
    XCTAssertEqual("わた, めん,ワタ,メン,コットンリント,繰綿,もめん,モメン", last.synonyms)
    XCTAssertEqual(9113, last.waterLitres)
  }
  
  func testCheckTextTrimmed() {
    let result = DataParser.readAndParse(languageCode)
    
    for model in result {
      XCTAssertEqual(model.name, WaterString.trim(model.name))
      XCTAssertEqual(model.synonyms, WaterString.trim(model.synonyms))
    }
  }
}



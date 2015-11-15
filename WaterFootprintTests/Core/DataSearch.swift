import XCTest
@testable import WaterFootprint

class DataSearchTests: XCTestCase {
  
  func testDoesMatchSentence() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "Beef meat"))
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "Beef nothing"))
    XCTAssertEqual(false, DataSearch.doesMatchSentence(model, sentence: "nothing"))
  }
  
  func testDoesMatchSingleWord() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    
    XCTAssertEqual(true, DataSearch.doesMatchSingleWord(model, word: "Bee"))
    XCTAssertEqual(true, DataSearch.doesMatchSingleWord(model, word: "Meat"))
    XCTAssertEqual(false, DataSearch.doesMatchSingleWord(model, word: "nothing"))
  }
}
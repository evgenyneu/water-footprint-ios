import XCTest
@testable import WaterFootprint

class DataSearchTests: XCTestCase {
  
  func testDataMatchingSentence() {
    
    let model1 = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    let model2 = ProductModel(name: "Pork", synonyms: "Pig meat", waterLitres: 15415)
    let model3 = ProductModel(name: "Asparagus", synonyms: "", waterLitres: 15415)
    let data = [model1, model2, model3]
    
    let result = DataSearch.dataMatchingSentence(data, sentence: "meat")
    
    XCTAssertEqual(2, result.count)
    XCTAssertEqual("Beef", result[0].name)
    XCTAssertEqual("Pork", result[1].name)
  }
  
  func testDoesMatchSentence() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "Beef meat"))
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "   Beef    meat  "))
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "Meat"))
    XCTAssertEqual(true, DataSearch.doesMatchSentence(model, sentence: "   "))
    XCTAssertEqual(false, DataSearch.doesMatchSentence(model, sentence: "Beef nomatch"))
    XCTAssertEqual(false, DataSearch.doesMatchSentence(model, sentence: "nomatch"))
  }
  
  func testDoesMatchSentence_ignoreSpaces() {
    let model = ProductModel(name: "Brussels sprouts  ", synonyms: " ", waterLitres: 15415)
    
    XCTAssertEqual(false, DataSearch.doesMatchSentence(model, sentence: "Hello  world  "))
  }
  
  // MARK: - Match single word
  
  func testDoesMatchSingleWord() {
    let model = ProductModel(name: "Beef", synonyms: "Cow meat", waterLitres: 15415)
    
    XCTAssertEqual(true, DataSearch.doesMatchSingleWord(model, word: "bee"))
    XCTAssertEqual(true, DataSearch.doesMatchSingleWord(model, word: "Meat"))
    XCTAssertEqual(false, DataSearch.doesMatchSingleWord(model, word: "nothing"))
    XCTAssertEqual(false, DataSearch.doesMatchSingleWord(model, word: ""))
  }
  
  func testDoesMatchSingleWord_ignoreDiacritic() {
    let model = ProductModel(name: "Перец свежий", synonyms: "Чили, красный, чёрный", waterLitres: 15415)
    XCTAssertEqual(true, DataSearch.doesMatchSingleWord(model, word: "черный"))
  }
  
  func testDoesMatchSingleWord_ignoreSapce() {
    let model = ProductModel(name: "Brussels sprouts  ", synonyms: " ", waterLitres: 15415)
    
    XCTAssertEqual(false, DataSearch.doesMatchSingleWord(model, word: ""))
  }
}
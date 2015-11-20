import XCTest
@testable import WaterFootprint

class DataLanguageTests: XCTestCase {
  
  func testOverrideSupportedLanguage() {
    DataLanguage._currentLanguageCode = "da"
    XCTAssertEqual("da", DataLanguage.supportedLanguage())
  }
  
  func testSupportedLanguage() {
    XCTAssertEqual("en", DataLanguage.supportedLanguage(["en"]))
    XCTAssertEqual("en", DataLanguage.supportedLanguage(["en", "zh-ZH"]))
    XCTAssertEqual("zh", DataLanguage.supportedLanguage(["zh_ZH", "en"]))
    XCTAssertEqual("ja", DataLanguage.supportedLanguage(["ja", "zh"]))
    XCTAssertEqual("zh", DataLanguage.supportedLanguage(["it", "zh"]))
    XCTAssertEqual("ru", DataLanguage.supportedLanguage(["it", "ru"]))
    XCTAssertEqual("en", DataLanguage.supportedLanguage(["it"])) // unsupported language
    XCTAssertEqual("en", DataLanguage.supportedLanguage([])) // unsupported language
  }
  
  func testPreferredLanguages() {
    let result = DataLanguage.codes(["en-US", "en", "ru-RU", "fr_CA", "EN", "RU-RU", "FR_CA"])
    
    XCTAssertEqual(["en", "en", "ru", "fr", "en", "ru", "fr"], result)
  }
}

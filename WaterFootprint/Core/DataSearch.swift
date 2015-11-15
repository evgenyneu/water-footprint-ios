
struct DataSearch {
  static func doesMatchSingleWord(data: ProductModel, word: String) -> Bool {
    if WaterString.contains(data.name, substring: word, ignoreCase: true, ignoreDiacritic: true) {
      return true
    }
    
    if WaterString.contains(data.synonyms, substring: word, ignoreCase: true, ignoreDiacritic: true) {
      return true
    }
    
    return false
  }
  
  static func doesMatchSentence(data: ProductModel, sentence: String) -> Bool {
    let words = sentence.componentsSeparatedByString(" ")
    
    return words.contains { word in
      doesMatchSingleWord(data, word: word)
    }
  }
}
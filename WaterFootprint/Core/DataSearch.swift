
struct DataSearch {
  
  static func dataMatchingSentence(data: [ProductModel], sentence: String) -> [ProductModel] {
    
    return data.filter { model in
      doesMatchSentence(model, sentence: sentence)
    }
  }
  
  static func doesMatchSentence(model: ProductModel, sentence: String) -> Bool {
    let words = sentence.componentsSeparatedByString(" ")
    
    return words.contains { word in
      doesMatchSingleWord(model, word: word)
    }
  }
  
  static func doesMatchSingleWord(model: ProductModel, word: String) -> Bool {
    if WaterString.contains(model.name, substring: word, ignoreCase: true, ignoreDiacritic: true) {
      return true
    }
    
    if WaterString.contains(model.synonyms, substring: word, ignoreCase: true,
      ignoreDiacritic: true) {
        
      return true
    }
    
    return false
  }
}
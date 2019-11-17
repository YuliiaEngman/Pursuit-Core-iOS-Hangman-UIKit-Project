

//
//  HangManClass.swift
//  Hangman
//
//  Created by Yuliia Engman on 11/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class HangManClass {
    
    let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var guessMax = 7
    var word = ""
    var letter = ""
    var hiddenWordArray = [String]()

    func hiddenWord() -> String {
        var wordUnderscored = String()
        hiddenWordArray = Array(repeating: "_", count: word.count)
        wordUnderscored = hiddenWordArray.joined(separator: " ")
        return wordUnderscored
    }
}

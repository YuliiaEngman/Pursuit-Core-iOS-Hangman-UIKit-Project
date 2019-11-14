//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1UserInputTF: UITextField!
    @IBOutlet weak var hangingImage: UIImageView!
    @IBOutlet weak var displayedWordLabel: UILabel!
    @IBOutlet weak var player2EnterLetterTF: UITextField!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    var user1Input = ""
    var user2Input: Character = "a"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1UserInputTF.delegate = self
        player2EnterLetterTF.delegate = self
        
        displayedWordLabel.layer.borderColor = UIColor.black.cgColor
        displayedWordLabel.layer.borderWidth = 1.0
        displayedWordLabel.text = ""
        hangingImage.isHidden = true
        
        
        
        
        //    var hiddenWord: [Character] = Array(repeating: "_", count: player1UserInputTF.text?.count ?? 1)
        //displayedWordLabel.text = String(hiddenWord)
        
        
    }
    
    
    //    var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)
    
    @IBAction func newGamePressed(_ sender: UIButton) {
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        var hiddenWord: [Character] = Array(repeating: "_", count: user1Input.count)
        
        if textField == player1UserInputTF {
            user1Input = player1UserInputTF.text ?? ""
            
            // code from Alex: let hiddenWord = String(repeating: " _ ", count: user1Input.count) // _ _ _ _
            
            displayedWordLabel.text = String(hiddenWord)
            textField.resignFirstResponder()
        } else {
            var guessMax = 7
            var indices: Set<Int> = []
            
            
            for (index, char) in user1Input.enumerated() {
                if user2Input == char {
                    indices.insert(index)
                }
            }
            for (index, _) in hiddenWord.enumerated() {
                if indices.contains(index) {
                    hiddenWord[index] = user2Input
                }
                if !hiddenWord.contains("_") {
                    print("CONGRATULATIONS!!! You win!")
                }
                
                
                
            }
        }
        return true
    }
}

//var randomWord = Array(allWords.randomElement() ?? "animal")
//
//var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)
//
//
//
//var enteredChar: Character
//
//let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
//
//func resetGame() {
//    print("Reseting game.....")
//    guessMax = 6
//    randomWord = Array(allWords.randomElement() ?? "animal")
//    hiddenWord = Array(repeating: "_", count: randomWord.count)
//}
//
//repeat {
//    print("Your word to guess is:")
//    print(hiddenWord)
//    print("Enter just 1 character from \"a-z\"")
//    print(String(hiddenWord)) // "hi" is not a character app will crash
//    let userInput = readLine()?.lowercased() ?? ""
//    if userInput.count != 1 {
//        print("Please enter ONLY 1 character.")
//        continue
//    }
//    enteredChar = Character(userInput)
//    var indices: Set<Int> = []
//
//    if !randomWord.contains(enteredChar) {
//        guessMax -= 1
//        hangmanArt()
//        print("""
//The word does not contain such letter.
//You have \(guessMax) attempt left.
//""")
//
//        if guessMax == 0 {
//            print("Sorry, you lost...")
//            print("The hidden word was \(randomWord)")
//            print("Do you want to play again? \"Yes\" or \"No\"?")
//            let response = readLine()?.lowercased() ?? ""
//            if response == "yes" {
//                // reset all variable to default values
//                resetGame()
//            }
//        }
//
//        continue
//    }
//
//    for (index, char) in randomWord.enumerated() {
//        if enteredChar == char {
//            indices.insert(index)
//        }
//    }
//
//    for (index, _) in hiddenWord.enumerated() {
//        if indices.contains(index) {
//            hiddenWord[index] = enteredChar
//        }
//        if !hiddenWord.contains("_") {
//            print("CONGRATULATIONS!!! You win!")
//            print("The hidden word was \(hiddenWord)")
//            sleep(2)
//            print("Do you want to play again?")
//            print("Yes or No?")
//
//            let continueGame = readLine()?.lowercased() ?? "no"
//
//            if continueGame == "yes" {
//                resetGame()
//                continue
//            }
//        }
//    }
//
//    // print(String(hiddenWord))
//} while guessMax >= 1 && randomWord != hiddenWord
//
// print("Goodbye! See you next time!")



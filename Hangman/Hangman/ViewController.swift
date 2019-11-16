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
    @IBOutlet weak var winLooseLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    var user1Input: [String.Element] = []
    var user2Input: Character = "a"
    var hiddenWord: [Character] = []
    let alphabets: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
    var guessMax = 7
    
    
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
        hangingImage.isHidden = true
        guessMax = 7
        player1UserInputTF.text = ""
        displayedWordLabel.text = ""
        player2EnterLetterTF.isEnabled = true
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        if textField == player1UserInputTF {
            user1Input = Array(player1UserInputTF.text ?? "")
            hiddenWord = Array(repeating: "_", count: user1Input.count)
            
            // code from Alex: let hiddenWord = String(repeating: " _ ", count: user1Input.count) // _ _ _ _
            
            displayedWordLabel.text = String(hiddenWord)
            textField.resignFirstResponder()
        } else {

            user2Input = Character(player2EnterLetterTF.text ?? "")
            var indices: Set<Int> = []
            
            repeat {
            for (index, char) in user1Input.enumerated() {
                if user2Input == char {
                    indices.insert(index)
                }
            }
            for (index, _) in hiddenWord.enumerated() {
                if indices.contains(index) {
                    hiddenWord[index] = user2Input
                    displayedWordLabel.text = String(hiddenWord)
                    player2EnterLetterTF.text = ""
                    if !hiddenWord.contains("_") {
                        player2EnterLetterTF.isEnabled = false
                    }
                } else {
                    guessMax -= 1
                    hangingImage.isHidden = false
                    switch guessMax {
                    case 6:
                        hangingImage.image = #imageLiteral(resourceName: "hang1")
                    case 5:
                        hangingImage.image = #imageLiteral(resourceName: "hang2")
                    case 4:
                        hangingImage.image = #imageLiteral(resourceName: "hang3")
                    case 3:
                        hangingImage.image = #imageLiteral(resourceName: "hang4")
                    case 2:
                        hangingImage.image = #imageLiteral(resourceName: "hang5")
                    case 1:
                        hangingImage.image = #imageLiteral(resourceName: "hang6")
                    case 0:
                        hangingImage.image = #imageLiteral(resourceName: "hang7")
                    default:
                        hangingImage.image = #imageLiteral(resourceName: "cat")
                    }
                 player2EnterLetterTF.text = ""
                    
                }
                
//                var currentSegmenyIndex: Int = 0{
//                       didSet {
//                           switch segmentedControl.selectedSegmentIndex {
//                           case 0:
//                               imageView.image = #imageLiteral(resourceName: "cat")
//                           case 1:
//                               imageView.image = #imageLiteral(resourceName: "dog")
//                           default:
//                               imageView.image = #imageLiteral(resourceName: "pitons")
//                           }
//                       }
//                   }
                
//                if !hiddenWord.contains("_") {
//                    print("CONGRATULATIONS!!! You win!")
//                }
//                
//                
//                
//            }
                 
        }
         } while guessMax > 0 || !hiddenWord.contains("_")
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



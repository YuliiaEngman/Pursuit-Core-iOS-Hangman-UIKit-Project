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
    
    var hangMan = HangManClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1UserInputTF.delegate = self
        player2EnterLetterTF.delegate = self
        
        displayedWordLabel.layer.borderColor = UIColor.black.cgColor
        displayedWordLabel.layer.borderWidth = 1.0
        displayedWordLabel.text = ""
        hangingImage.isHidden = true
        
        player2EnterLetterTF.isEnabled = false
        
    }
    
  //var hiddenWord: [Character] = Array(repeating: "_", count: randomWord.count)
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        hangingImage.isHidden = true
        player1UserInputTF.isHidden = false
        hangMan.guessMax = 7
        player1UserInputTF.text = ""
        displayedWordLabel.text = ""
        player2EnterLetterTF.isEnabled = true
        winLooseLabel.text = "HANGMAN GAME"
        player2EnterLetterTF.isEnabled = false
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        func incorrectGuess() {
            if !hangMan.word.contains(hangMan.letter) {
                hangMan.guessMax -= 1
            }
            if hangMan.guessMax == 0 {
                winLooseLabel.text = "YOU LOST!!!"
                player2EnterLetterTF.isEnabled = false
            }
        }
        
        func correcetGuessedLetter() {
            for (index, char) in hangMan.word.enumerated() {
                if hangMan.letter == String(char) {
                    hangMan.hiddenWordArray[index] = hangMan.letter
                }
                displayedWordLabel.text = hangMan.hiddenWordArray.joined(separator: " ")
            }
            if !hangMan.hiddenWordArray.contains("_") {
                winLooseLabel.text = "YOU WIN!!!"
                hangingImage.image = UIImage(named: "winLabel")
                hangingImage.isHidden = false
                player2EnterLetterTF.isEnabled = false
            }
        }
        
        func imageChange() {
            hangingImage.isHidden = false
            switch hangMan.guessMax {
            case 6:
                hangingImage.image = UIImage(named: "hang1")
            case 5:
                hangingImage.image = UIImage(named: "hang2")
            case 4:
                hangingImage.image = UIImage(named: "hang3")
            case 3:
                hangingImage.image = UIImage(named: "hang4")
            case 2:
                hangingImage.image = UIImage(named: "hang5")
            case 1:
                hangingImage.image = UIImage(named: "hang6")
            default:
                hangingImage.image = UIImage(named: "hang7")
            }
        }
        
        
        if textField == player1UserInputTF {
            hangMan.word = player1UserInputTF.text?.lowercased() ?? ""
            // hiddenWord = Array(repeating: "_", count: user1Input.count)
            
            // code from Alex: let hiddenWord = String(repeating: " _ ", count: user1Input.count) // _ _ _ _
            
            displayedWordLabel.text = hangMan.hiddenWord()
            textField.resignFirstResponder()
            player1UserInputTF.isHidden = true
            player2EnterLetterTF.isEnabled = true
        } else if textField == player2EnterLetterTF {
            hangMan.letter = player2EnterLetterTF.text?.lowercased() ?? ""
            correcetGuessedLetter()
            incorrectGuess()
            if hangMan.guessMax < 7 {
                imageChange()
            }
            print(hangMan.hiddenWordArray)
            
        }
        textField.text = ""
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let alphabet = hangMan.alphabet
        
        if textField == player2EnterLetterTF {
            if alphabet.contains(string.lowercased()) {
                if player2EnterLetterTF.text?.count == 1 {
                    return false
                }
            }
            return true
        } else if textField == player1UserInputTF {
            if alphabet.contains(string.lowercased()) {
                return true
            }
        }
        return false
    }
}





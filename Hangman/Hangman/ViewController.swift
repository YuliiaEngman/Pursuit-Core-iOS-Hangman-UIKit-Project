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
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
    
    
    @IBAction func newGamePressed(_ sender: UIButton) {
    }
    


}


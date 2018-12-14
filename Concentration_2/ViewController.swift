//
//  ViewController.swift
//  Concentration
//
//  Created by madao on 2018/12/5.
//  Copyright © 2018 madao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    // using lazy can aviod that initializer cannot use instance, but lazy cannot use didset {}
    

    var flipsCount = 0 {
        didSet {
            flipsLabel.text = "Flips: \(flipsCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipsCount += 1
        let cardNumber = cardButtons.index(of: sender)
        if let cardNumber = cardNumber {
            game.choose(at: cardNumber)
            updateViewFromModel()
        } else {
            print("The card is out of range")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            // for button in cardButtons
            // for index in 0..<cardButtons.count
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻","💊","💀","🐸","🐷","🐒","🐴"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
           // if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
        /*
         if emoji[card.identifier] != nil { // if let
         return emoji[card.identifier]!
         } else {
         return "?"
         }
         */
    }
    
    
}


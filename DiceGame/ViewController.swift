//
//  ViewController.swift
//  DiceGame
//
//  Created by Stu Cowley on 20/06/2019.
//  Copyright © 2019 Stu Cowley. All rights reserved.
//

import UIKit

// MARK: Variables
class variables {
    var dice = [#imageLiteral(resourceName: "Kismet-Ace.png"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five.png"),#imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex: Int = 0
    var score: Int = 0
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
    var currentPlayer = "playerOne"
    var ended = false
    var wins: Int = 0
    var attempts: Int = 0
    var winRate = 0.0
    var messages: [String: String] = ["rules":"Roll the dice, get 21 or higher to win. \n Roll a one and you LOSE!",  "start": "Let us begin...", "rollOne": "You rolled a one, you lose!", "win": "You got to the end, you win!", "midOne":"Keep going...", "midTwo":"You on the way", "midThree":"You so close!"]
}

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var OnePlayerScoreLabel: UILabel!
    @IBOutlet weak var OnePlayerRulesLabel: UILabel!
    @IBOutlet weak var OnePlayerMainMessageLabel: UILabel!
    @IBOutlet weak var OnePlayerDiceImage: UIImageView!
    @IBOutlet weak var OnePlayerRollButton: UIButton!
    
    // MARK: Actions
    @IBAction func OnePlayerRollButtonAction(_ sender: Any) {
        if (OnePlayerMainMessageLabel.text == stats.messages["rollOne"]) {
            OnePlayerScoreLabel.backgroundColor = .none
        } else if (OnePlayerMainMessageLabel.text == stats.messages["win"]) {
            OnePlayerScoreLabel.backgroundColor = .none
        }
        stats.randomDiceIndex = Int.random(in: 0 ... 5)
        OnePlayerDiceImage.image = stats.dice[stats.randomDiceIndex]
        stats.score = stats.score + stats.randomDiceIndex + 1
            OnePlayerScoreLabel.text = "Your score: " + String(stats.score)
            diceLogic()
        }
    
    // MARK: Functions
    // Get to 21 or higher you win
    // Roll a 1, you lose
    
        func diceLogic() {
            view.backgroundColor = .orange
            if (stats.score == 0) {
                OnePlayerScoreLabel.backgroundColor = .none
                OnePlayerMainMessageLabel.text = stats.messages["start"]
            } else if (stats.randomDiceIndex == 0) {
                OnePlayerMainMessageLabel.text = stats.messages["rollOne"]
                stats.score = 0
                stats.attempts = stats.attempts + 1
                OnePlayerScoreLabel.backgroundColor = .red
            } else if (stats.score <= 10) {
                OnePlayerMainMessageLabel.text = stats.messages["midOne"]
            } else if (stats.score <= 16) {
                OnePlayerMainMessageLabel.text = stats.messages["midTwo"]
            } else if (stats.score <= 19) {
                OnePlayerMainMessageLabel.text = stats.messages["midThree"]
            } else if (stats.score >= 21) {
                OnePlayerMainMessageLabel.text = stats.messages["win"]
                stats.score = 0
                stats.wins = stats.wins + 1
                stats.attempts = stats.attempts + 1
                OnePlayerScoreLabel.backgroundColor = .yellow
            } else {return}
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OnePlayerScoreLabel.text = " "
        OnePlayerRulesLabel.text = stats.messages["onePlayerRules"]
        diceLogic()
    }
}

var stats = variables()

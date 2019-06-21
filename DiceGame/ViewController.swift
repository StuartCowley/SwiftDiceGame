//
//  ViewController.swift
//  DiceGame
//
//  Created by CodeNation18 on 20/06/2019.
//  Copyright © 2019 CodeNation18. All rights reserved.
//

import UIKit

// MARK: Variables
class variables {
    var dice = [#imageLiteral(resourceName: "Kismet-Ace.png"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five.png"),#imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex: Int = 0
    var score: Int = 0
    var wins:Int = 0
    var attempts:Int = 0
    var winRate = 0.0
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
        if (OnePlayerMainMessageLabel.text == "You rolled a one, you lose!") {
            OnePlayerScoreLabel.backgroundColor = .none
        } else if (OnePlayerMainMessageLabel.text == "You got to the end, you win!") {
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
                OnePlayerMainMessageLabel.text = "Let us begin..."
            } else if (stats.randomDiceIndex == 0) {
                OnePlayerMainMessageLabel.text = "You rolled a one, you lose!"
                stats.score = 0
                stats.attempts = stats.attempts + 1
                OnePlayerScoreLabel.backgroundColor = .red
            } else if (stats.score <= 10) {
                OnePlayerMainMessageLabel.text = "Keep going..."
            } else if (stats.score <= 16) {
                OnePlayerMainMessageLabel.text = "You on the way"
            } else if (stats.score <= 19) {
                OnePlayerMainMessageLabel.text = "You so close!"
            } else if (stats.score >= 21) {
                OnePlayerMainMessageLabel.text = "You got to the end, you win!"
                stats.score = 0
                stats.wins = stats.wins + 1
                stats.attempts = stats.attempts + 1
                OnePlayerScoreLabel.backgroundColor = .yellow
            } else {return}
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OnePlayerScoreLabel.text = " "
        OnePlayerRulesLabel.text = "Roll the dice, get 21 or higher to win. \n Roll a one and you LOSE!"
        diceLogic()
    }
}

var stats = variables()

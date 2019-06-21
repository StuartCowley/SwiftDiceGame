//
//  secondViewController.swift
//  DiceGame
//
//  Created by Stu Cowley on 20/06/2019.
//  Copyright © 2019 Stu Cowley. All rights reserved.
//

import Foundation
import UIKit

class secondViewController: UIViewController {
   
    // MARK: Outlets
    
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func rollButtonAction(_ sender: Any) {
        if (stats.ended) {
            reset()
            return
        }
        stats.randomDiceIndex = Int.random(in: 0 ... 5)
        diceImage.image = stats.dice[stats.randomDiceIndex]
        if stats.currentPlayer == "playerOne" {
            playerTwoScoreLabel.backgroundColor = .none
            playerOneScoreLabel.backgroundColor = .cyan
            stats.playerOneScore = stats.playerOneScore + stats.randomDiceIndex + 1
            playerOneScoreLabel.text = "Player 1's score: " + String(stats.playerOneScore)
            diceLogic()
        } else if stats.currentPlayer == "playerTwo" {
            playerOneScoreLabel.backgroundColor = .none
            playerTwoScoreLabel.backgroundColor = .cyan
            stats.playerTwoScore = stats.playerTwoScore + stats.randomDiceIndex + 1
            playerTwoScoreLabel.text = "Player 2's score: " +  String(stats.playerTwoScore)
            diceLogic()
        }
    }
    
    
    // MARK: Functions
    
    // Get to 21 or higher you win
    // Roll a 1, you lose
    // Reset function
    
    func reset() {
        stats.playerOneScore = 0
        stats.playerTwoScore = 0
        playerOneScoreLabel.text = "Player 1's score: " + String(stats.playerOneScore)
        playerTwoScoreLabel.text = "Player 2's score: " + String(stats.playerTwoScore)
        playerTwoScoreLabel.backgroundColor = .none
        playerOneScoreLabel.backgroundColor = .none
        stats.currentPlayer = "playerOne"
        stats.ended = false
    }
        
    
    func diceLogic() {
        if (stats.currentPlayer == "playerOne") {
            if (stats.playerOneScore == 0) {
                mainMessageLabel.text = "Let us begin..."
            } else if (stats.randomDiceIndex == 0) {
                mainMessageLabel.text = "You rolled a one, player 2 wins!"
                stats.ended = true
                stats.playerOneScore = 0
                stats.playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .gray
                playerTwoScoreLabel.backgroundColor = .yellow
            } else if (stats.playerOneScore <= 10) {
                mainMessageLabel.text = stats.messages["midOne"]
                stats.currentPlayer = "playerTwo"
            } else if (stats.playerOneScore <= 16) {
                mainMessageLabel.text = "Player 1's on the way..."
                stats.currentPlayer = "playerTwo"
            } else if (stats.playerOneScore <= 19) {
                mainMessageLabel.text = stats.messages["midThree"]
                stats.currentPlayer = "playerTwo"
            } else if (stats.playerOneScore >= 21) {
                mainMessageLabel.text = "You got to the end, player 1 is victorious!"
                stats.ended = true
                stats.playerOneScore = 0
                stats.playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .yellow
                playerTwoScoreLabel.backgroundColor = .gray
            } else {return}
        } else if (stats.currentPlayer == "playerTwo") {
            if (stats.randomDiceIndex == 0) {
                mainMessageLabel.text = "You rolled a one, player 1 wins!"
                stats.ended = true
                stats.playerOneScore = 0
                stats.playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .yellow
                playerTwoScoreLabel.backgroundColor = .gray
            } else if (stats.playerTwoScore <= 10) {
                mainMessageLabel.text = stats.messages["midOne"]
                stats.currentPlayer = "playerOne"
            } else if (stats.playerTwoScore <= 16) {
                mainMessageLabel.text = "Player 2's on the way"
                stats.currentPlayer = "playerOne"
            } else if (stats.playerTwoScore <= 19) {
                mainMessageLabel.text = stats.messages["midThree"]
                stats.currentPlayer = "playerOne"
            } else if (stats.playerTwoScore >= 21) {
                mainMessageLabel.text = "You got to the end, player 2 is triumphant!"
                stats.ended = true
                stats.playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .gray
                playerTwoScoreLabel.backgroundColor = .yellow
                stats.currentPlayer = "playerOne"
            } else {return}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        playerOneScoreLabel.text = "Player 1's score: "
        playerTwoScoreLabel.text = "Player 2's score: "
        rulesLabel.text = stats.messages["rules"]
        diceLogic()
    }
    
    
}


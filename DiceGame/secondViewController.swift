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
    
    // MARK: Variables
    var dice = [#imageLiteral(resourceName: "Kismet-Ace.png"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five.png"),#imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex: Int = 0
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
    var currentPlayer = "playerOne"
    var ended = false
    
    // MARK: Outlets
    
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func rollButtonAction(_ sender: Any) {
        if (ended) {
            reset()
            return
        }
        randomDiceIndex = Int.random(in: 0 ... 5)
        diceImage.image = dice[randomDiceIndex]
        if currentPlayer == "playerOne" {
            playerTwoScoreLabel.backgroundColor = .none
            playerOneScoreLabel.backgroundColor = .cyan
            playerOneScore = playerOneScore + randomDiceIndex + 1
            playerOneScoreLabel.text = "Player 1's score: " + String(playerOneScore)
            diceLogic()
        } else if currentPlayer == "playerTwo" {
            playerOneScoreLabel.backgroundColor = .none
            playerTwoScoreLabel.backgroundColor = .cyan
            playerTwoScore = playerTwoScore + randomDiceIndex + 1
            playerTwoScoreLabel.text = "Player 2's score: " +  String(playerTwoScore)
            diceLogic()
        }
    }
    
    
    // MARK: Functions
    
    // Get to 21 or higher you win
    // Roll a 1, you lose
    // Reset function
    
    func reset() {
        playerOneScore = 0
        playerTwoScore = 0
        playerOneScoreLabel.text = "Player 1's score: " + String(playerOneScore)
        playerTwoScoreLabel.text = "Player 2's score: " + String(playerTwoScore)
        playerTwoScoreLabel.backgroundColor = .none
        playerOneScoreLabel.backgroundColor = .none
        currentPlayer = "playerOne"
        ended = false
    }
    
    func diceLogic() {
        if (currentPlayer == "playerOne") {
            if (playerOneScore == 0) {
                mainMessageLabel.text = "Let us begin..."
            } else if (randomDiceIndex == 0) {
                mainMessageLabel.text = "You rolled a one, player 2 wins!"
                ended = true
                playerOneScore = 0
                playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .gray
                playerTwoScoreLabel.backgroundColor = .yellow
            } else if (playerOneScore <= 10) {
                mainMessageLabel.text = "Keep going..."
                currentPlayer = "playerTwo"
            } else if (playerOneScore <= 16) {
                mainMessageLabel.text = "Player 1's on the way..."
                currentPlayer = "playerTwo"
            } else if (playerOneScore <= 19) {
                mainMessageLabel.text = "You so close!"
                currentPlayer = "playerTwo"
            } else if (playerOneScore >= 21) {
                mainMessageLabel.text = "You got to the end, player 1 is victorious!"
                ended = true
                playerOneScore = 0
                playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .yellow
                playerTwoScoreLabel.backgroundColor = .gray
            } else {return}
        } else if (currentPlayer == "playerTwo") {
            if (randomDiceIndex == 0) {
                mainMessageLabel.text = "You rolled a one, player 1 wins!"
                ended = true
                playerOneScore = 0
                playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .yellow
                playerTwoScoreLabel.backgroundColor = .gray
            } else if (playerTwoScore <= 10) {
                mainMessageLabel.text = "Keep going..."
                currentPlayer = "playerOne"
            } else if (playerTwoScore <= 16) {
                mainMessageLabel.text = "Player 2's on the way"
                currentPlayer = "playerOne"
            } else if (playerTwoScore <= 19) {
                mainMessageLabel.text = "You so close!"
                currentPlayer = "playerOne"
            } else if (playerTwoScore >= 21) {
                mainMessageLabel.text = "You got to the end, player 2 is triumphant!"
                ended = true
                playerTwoScore = 0
                playerOneScoreLabel.backgroundColor = .gray
                playerTwoScoreLabel.backgroundColor = .yellow
                currentPlayer = "playerOne"
            } else {return}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        playerOneScoreLabel.text = "Player 1's score: "
        playerTwoScoreLabel.text = "Player 2's score: "
        rulesLabel.text = "Take turns to roll the dice, get 21 or higher to win. \n Roll a one and you LOSE!"
        diceLogic()
    }
    
    
}


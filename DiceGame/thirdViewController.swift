//
//  thirdViewController.swift
//  DiceGame
//
//  Created by CodeNation18 on 20/06/2019.
//  Copyright © 2019 CodeNation18. All rights reserved.
//

import Foundation
import UIKit

class thirdViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var statisticsLabel: UILabel!
    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var attemptsNumLabel: UILabel!
    @IBOutlet weak var successesLabel: UILabel!
    @IBOutlet weak var successesNumLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    @IBOutlet weak var winRateNumLabel: UILabel!
    @IBOutlet weak var resetStatsButton: UIButton!
    
    // MARK: Actions
    
    
    @IBAction func resetStatsButton(_ sender: Any) {
        stats.attempts = 0
        stats.wins = 0
        stats.winRate = 0.0
        refreshStats()
    }
    
    
    
    // MARK: Functions
    // Function to calculate the win rate
    // Function to display number of attempts, number of successes, and win rate
    
    func calcWinRate() {
        if (stats.wins != 0) {
            stats.winRate = Double((Double(stats.wins) / Double(stats.attempts)))
        }
    }
    
    func refreshStats() {
        attemptsNumLabel.text = String(stats.attempts)
        successesNumLabel.text = String(stats.wins)
        if (stats.wins == 0) {
            winRateNumLabel.text = "You havent won any games yet. Get on with it!"
        } else {
            calcWinRate()
        winRateNumLabel.text = String(round(stats.winRate*10000)/100) + " %"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calcWinRate()
        refreshStats()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statisticsLabel.text = "Statistics \n (for 1 player game only)"
        refreshStats()
        calcWinRate()
        view.backgroundColor = .orange
    }
}

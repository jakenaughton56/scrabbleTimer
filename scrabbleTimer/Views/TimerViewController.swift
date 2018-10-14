//
//  ViewController.swift
//  scrabbleTimer
//
//  Created by Jake Mobile Dev on 14/10/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController
{
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    var timer = Timer()
    var playerOne = Player(name: Constants.playerOne, seconds: 120)
    var playerTwo = Player(name: Constants.playerTwo, seconds: 120)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTime(player: playerOne)
        playerLabel.text = Constants.startGameText
    }
    
    @IBAction func finishedTurnButton() {
        if playerLabel.text == playerOne.name {
            playerLabel.text = playerTwo.name
            displayTime(player: playerTwo)
        } else {
            playerLabel.text = playerOne.name
            displayTime(player: playerOne)
        }
        self.runTimer()
    }
    
    func runTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if playerLabel.text == playerOne.name {
            playerOne.secondsLeft -= 1
            displayTime(player: playerOne)
        } else {
            playerTwo.secondsLeft -= 1
            displayTime(player: playerTwo)
        }
    }
    
    func displayTime(player: Player) {
        if player.secondsLeft <= 0 {
            timerLabel.text = String(format:"%02i:%02i", 0, 0)
            return
        }
        let minutes = player.secondsLeft/Constants.secondsInMinute
        let seconds = player.secondsLeft%60
        timerLabel.text = String(format:"%02i:%02i", minutes, seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


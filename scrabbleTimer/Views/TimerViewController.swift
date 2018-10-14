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
    var playerOne = Player(name: Constants.playerOne, minutes: 25, seconds: 60)
    var playerTwo = Player(name: Constants.playerTwo, minutes: 25, seconds: 60)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "\(playerOne.timer.seconds)"
        playerLabel.text = playerOne.name
    }
    
    @IBAction func finishedTurnButton() {
        if playerLabel.text == playerOne.name {
            playerLabel.text = playerTwo.name
            timerLabel.text = "\(playerTwo.timer.seconds)"
        } else {
            playerLabel.text = playerOne.name
            timerLabel.text = "\(playerOne.timer.seconds)"
        }
        self.runTimer()
    }
    
    
    func runTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if playerLabel.text == playerOne.name {
            playerOne.timer.seconds -= 1
            timerLabel.text = "\(playerOne.timer.seconds)"
        } else {
            playerTwo.timer.seconds -= 1
            timerLabel.text = "\(playerTwo.timer.seconds)"
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


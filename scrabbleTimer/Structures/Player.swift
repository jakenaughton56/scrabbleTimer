//
//  Player.swift
//  scrabbleTimer
//
//  Created by Jake Mobile Dev on 14/10/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import Foundation

struct Player {
    var name: String
    var timer: PlayerTimer
    
    init(name: String, minutes: Int, seconds: Int) {
        self.name = name
        self.timer = PlayerTimer(minutes: minutes, seconds: seconds)
    }
}

struct PlayerTimer {
    var minutes: Int
    var seconds: Int
    init(minutes: Int, seconds: Int) {
        self.minutes = minutes
        self.seconds = seconds
    }
}

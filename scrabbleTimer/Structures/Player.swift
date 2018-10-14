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
    var secondsLeft: Int
    
    init(name: String, seconds: Int) {
        self.name = name
        self.secondsLeft = seconds
    }
}


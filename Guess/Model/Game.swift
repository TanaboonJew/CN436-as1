//
//  Game.swift
//  Guess The Num
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 25/1/2567 BE.
//

import Foundation

struct Game {
    var target:Int = Int.random(in:1...100)
    var score = 0
    var diff = 0
    
    mutating func check(guess: Int) {
        diff = target - guess
        score += 1
    }
    
    mutating func isMore() -> Bool {
        if diff < 0 {
            return false
        }
        else if diff > 0 {
            return true
        }
        return false
    }
    
    mutating func startNewGame() {
        score = 0
        target = Int.random(in: 1...100)
    }
}

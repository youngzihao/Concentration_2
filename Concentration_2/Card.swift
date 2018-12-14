//
//  Card.swift
//  Concentration
//
//  Created by madao on 2018/12/5.
//  Copyright © 2018 madao. All rights reserved.
//

import Foundation

struct Card {
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    static var identifierFactory = 0
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

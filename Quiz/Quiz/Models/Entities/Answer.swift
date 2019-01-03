//
//  Answer.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation

class Answer {
    let id: String
    let isCorrect: Bool
    var ifSelected = false
    
    init(id: String, isCorrect: Bool) {
        self.id = id
        self.isCorrect = isCorrect
    }
}

//
//  TextEntity.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation

class TextEntity: Answer {
    let text: String
    
    init(id: String, isCorrect: Bool, text: String) {
        self.text = text
        super.init(id: id, isCorrect: isCorrect)
    }
}

//
//  QuizManager.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation

class QuizManager {
    
    let questions: [Question]
    var currentQuestion: Int!
    
    var question: Question? {
        let index = currentQuestion == nil ? 0 : currentQuestion + 1
        currentQuestion = index
        guard questions.indices.contains(index) else { return nil }
        return questions[index]
    }
    
    init(questions: [Question]) {
        self.questions = questions
    }
}

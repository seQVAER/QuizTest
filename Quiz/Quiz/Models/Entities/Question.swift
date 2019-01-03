//
//  Question.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

enum QuestionType: String {
    case text
}

class Question {
    let id: String
    let type: QuestionType
    let category: String
    let question: String
    let image: UIImage
    let answerId: String
    let responseOptions: [Answer]
    var selectedAnswer: String?
    
    init(id: String, type: QuestionType, category: String, question: String, image: UIImage, answerId: String, responseOptions: [Answer]) {
        self.id = id
        self.type = type
        self.category = category
        self.question = question
        self.image = image
        self.answerId = answerId
        self.responseOptions = responseOptions
    }
}

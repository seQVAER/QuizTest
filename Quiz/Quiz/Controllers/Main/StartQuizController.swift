//
//  StartQuizController.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

class StartQuizController: UIViewController {
    
    @IBAction func startQuiz(_ sender: UIButton) {
        let questions = [Question(id: "0",
                                  type: .text,
                                  category: "Geography",
                                  question: "Which building is shown in this image?",
                                  image: #imageLiteral(resourceName: "colosseum"),
                                  answerId: "11",
                                  responseOptions: [
                                    TextEntity(id: "00", isCorrect: false, text: "Chrysler Building, Chicago, USA"),
                                    TextEntity(id: "11", isCorrect: true, text: "Coliseum in Rome, Italy"),
                                    TextEntity(id: "22", isCorrect: false, text: "Dome of Oman"),
                                    TextEntity(id: "33", isCorrect: false, text: "Tokyo Tower")])]
        
        let quizManager = QuizManager(questions: questions)
        let vc = QuizFormController.fromStoryboard(.quiz, dependence: quizManager)
        push(vc)
    }
}


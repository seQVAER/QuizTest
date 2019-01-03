//
//  ViewController.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizManager: QuizManager!
    
    init(with quizManager: QuizManager) {
        self.quizManager = quizManager
        super.init(nibName: nil, bundle: nil)
        hideKeyboardWhenTappedAround()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

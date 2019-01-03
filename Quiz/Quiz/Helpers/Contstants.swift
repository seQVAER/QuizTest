//
//  Contstants.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case quiz
    
    var filename: String {
        return rawValue.capitalizingFirstLetter()
    }
}

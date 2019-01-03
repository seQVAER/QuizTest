//
//  String.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

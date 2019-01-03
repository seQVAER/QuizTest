//
//  QuestionCellModel.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation

struct QuestionCellModel {
    var contentBlock: Question
}

extension QuestionCellModel: CellViewModelType {
    
    func setup(on cell: QuestionCell) {
        
        cell.categoryLabel.text = contentBlock.category
        cell.questionLabel.text = contentBlock.question
        cell.imageView.image = contentBlock.image
    }
}

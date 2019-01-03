//
//  TextAnswerCellModel.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

struct TextAnswerCellModel {
    var contentBlock: TextEntity
    var displayType: DisplayType
}

extension TextAnswerCellModel: CellViewModelType {
    
    func setup(on cell: TextAnswerCell) {
        
        switch displayType {
        case .default:
            cell.answerLabel.text = contentBlock.text
            cell.checkImageView.image = contentBlock.ifSelected ? #imageLiteral(resourceName: "icon-check-blue") : nil
            cell.answerLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .answer:
            if contentBlock.isCorrect && contentBlock.ifSelected {
                cell.answerLabel.text = contentBlock.text
                cell.checkImageView.image = #imageLiteral(resourceName: "icon-check-green")
                cell.answerLabel.textColor = #colorLiteral(red: 0.4196078431, green: 0.5725490196, blue: 0.2588235294, alpha: 1)
            } else if contentBlock.isCorrect && !contentBlock.ifSelected {
                cell.answerLabel.text = contentBlock.text
                cell.checkImageView.image = #imageLiteral(resourceName: "icon-right_answer")
                cell.answerLabel.textColor = #colorLiteral(red: 0.4196078431, green: 0.5725490196, blue: 0.2588235294, alpha: 1)
            } else if !contentBlock.isCorrect && contentBlock.ifSelected {
                cell.answerLabel.attributedText = attributed(text: contentBlock.text)
                cell.checkImageView.image = #imageLiteral(resourceName: "icon-cancel-red")
                cell.answerLabel.textColor = #colorLiteral(red: 0.8235294118, green: 0.1215686275, blue: 0.2117647059, alpha: 1)
            } else {
                cell.answerLabel.text = contentBlock.text
                cell.checkImageView.image = nil
            }
        }
    }
    
    func attributed(text: String) -> NSAttributedString {
        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.blue,
                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                           NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
        return NSAttributedString(string: text, attributes: myAttribute)
    }
}

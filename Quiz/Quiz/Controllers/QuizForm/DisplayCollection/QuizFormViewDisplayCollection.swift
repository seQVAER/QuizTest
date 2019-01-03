//
//  QuizFormViewDisplayCollection.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import Foundation
import UIKit

enum DisplayType {
    case `default`
    case answer
}

class QuizFormViewDisplayCollection: NSObject, DisplayCollection {
    
    static var modelsForRegistration: [CellViewAnyModelType.Type] {
        return [TextAnswerCellModel.self, QuestionCellModel.self]
    }
    
    static var headersForRegistration: [UICollectionReusableView.Type] {
        return [HeaderView.self]
    }
    
    enum `Type` {
        case head, answer
    }
    
    private var sections: [Type] = [.head, .answer]
    
    weak var delegate: DisplayCollectionDelegate?
    
    var question: Question
    var displayType: DisplayType = .default
    
    init(question: Question) {
        self.question = question
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func isEmptyAnswer() -> Bool {
        return !question.responseOptions.contains(where: { $0.ifSelected == true })
    }
    
    func reset() {
        for index in question.responseOptions.indices {
            question.responseOptions[index].ifSelected = false
        }
        displayType = .default
        self.delegate?.updateUI()
    }
    
    func next() -> Bool {
        displayType = .answer
        self.delegate?.updateUI()
        let answer = question.responseOptions.first(where: { $0.ifSelected == true && $0.isCorrect == true })
        return answer != nil
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch sections[section] {
        case .head:     return 1
        case .answer:   return question.responseOptions.count
        }
    }
    
    func sectionHeaderHeight(in section: Int) -> CGFloat {
        switch sections[section] {
        case .head:     return 0
        case .answer:   return 40
        }
    }
    
    func header(for indexPath: IndexPath) -> UICollectionReusableView.Type {
        switch sections[indexPath.section] {
        case .head:     return UICollectionReusableView.self
        case .answer:   return HeaderView.self
        }
    }
    
    func model(for indexPath: IndexPath) -> CellViewAnyModelType {
        let type = sections[indexPath.section]
        switch type {
        case .head:
            return QuestionCellModel(contentBlock: question)
        case .answer:
            switch question.type {
            case .text:
                return TextAnswerCellModel(contentBlock: question.responseOptions[indexPath.row] as! TextEntity, displayType: displayType)
            }
        }
    }
}

extension QuizFormViewDisplayCollection: DisplayCollectionAction {
    
    func didSelect(indexPath: IndexPath) {
        guard displayType == .default else { return }
        let type = sections[indexPath.section]
        switch type {
        case .answer:
            for index in question.responseOptions.indices {
                question.responseOptions[index].ifSelected = index == indexPath.row ? true : false
            }
            self.delegate?.updateUI()
        default: break
        }
    }
}

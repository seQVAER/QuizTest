//
//  DisplayCollection.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

protocol DisplayCollection {
    var numberOfSections: Int { get }
    static var modelsForRegistration: [CellViewAnyModelType.Type] { get }
    static var headersForRegistration: [UICollectionReusableView.Type] { get }
    
    func numberOfRows(in section: Int) -> Int
    func model(for indexPath: IndexPath) -> CellViewAnyModelType
}

protocol DisplayCollectionAction {
    func didSelect(indexPath: IndexPath)
}

protocol DisplayCollectionFlowLayout {
    func layout(indexPath: IndexPath, cell: UICollectionViewCell) -> CGSize
}

extension DisplayCollection {
    var numberOfSections: Int {
        return 1
    }
}

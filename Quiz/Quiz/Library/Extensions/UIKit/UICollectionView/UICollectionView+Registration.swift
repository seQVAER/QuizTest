//
//  UICollectionView+Registration.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView {
    func registerNibs(from displayCollection: DisplayCollection) {
        registerNibs(fromType: type(of: displayCollection))
    }
    
    private func registerNibs(fromType displayCollectionType: DisplayCollection.Type) {
        for cellModel in displayCollectionType.modelsForRegistration {
            if let tableCellClass = cellModel.cellClass() as? UICollectionViewCell.Type {
                registerNib(for: tableCellClass)
            }
        }
        for headerClass in displayCollectionType.headersForRegistration {
            registerHeaderNib(for: headerClass)
        }
    }
    
    func registerNib(for cellClass: UICollectionViewCell.Type) {
        register(cellClass.nib, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    func registerHeaderNib(for headerClass: UICollectionReusableView.Type) {
        register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: headerClass))
    }
    
    func registerClass(for cellClass: UICollectionViewCell.Type) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
}

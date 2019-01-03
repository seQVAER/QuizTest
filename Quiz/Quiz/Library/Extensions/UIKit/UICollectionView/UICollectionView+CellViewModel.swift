//
//  UICollectionView+CellViewModel.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView {
    func dequeueReusableCell(for indexPath: IndexPath, with model: CellViewAnyModelType) -> UICollectionViewCell {
        
        let cellIdentifier = String(describing: type(of: model).cellClass())
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        model.setupDefault(on: cell)
        
        return cell
    }
    
    func dequeueReusableSupplementaryView(ofKind: String, for indexPath: IndexPath, with view: UICollectionReusableView.Type) -> UICollectionReusableView {
        let viewIdentifier = String(describing: view)
        return dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: viewIdentifier, for: indexPath)
    }
}

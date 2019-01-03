//
//  UICollectionViewCell+ReusableCell.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit.UICollectionViewCell

extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}

extension UICollectionViewCell {
    
    var collectionView: UICollectionView? {
        return next(UICollectionView.self)
    }
    
    var indexPath: IndexPath? {
        return collectionView?.indexPath(for: self)
    }
}

extension UICollectionViewCell: ReusableCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

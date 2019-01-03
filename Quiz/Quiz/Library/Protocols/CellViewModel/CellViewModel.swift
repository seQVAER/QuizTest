//
//  CellViewModel.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

// Use this type in non-generic cases
protocol CellViewAnyModelType {
    static func cellClass() -> UIView.Type
    func setupDefault(on cell: UIView)
    
    func updateAppearance(of view: UIView, in parentView: UIView, at indexPath: IndexPath)
}

extension CellViewAnyModelType {
    func updateAppearance(of view: UIView, in parentView: UIView, at indexPath: IndexPath) { }
}

// This is for generic one and models itselfs
protocol CellViewModelType: CellViewAnyModelType {
    associatedtype CellClass: UIView
    func setup(on cell: CellClass)
}

// From generic to runtime
extension CellViewModelType {
    static func cellClass() -> UIView.Type {
        return Self.CellClass.self
    }
    
    func setupDefault(on cell: UIView) {
        setup(on: cell as! Self.CellClass)
    }
}

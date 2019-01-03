//
//  DisplayCollectionDelegate.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

protocol DisplayCollectionDelegate: class {
    func updateUI()
    func updateCells(_ indexPaths: [IndexPath])
    func present(_ viewController: UIViewController)
    func push(_ viewController: UIViewController)
}

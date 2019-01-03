//
//  ReusableCell.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit.UINib

protocol ReusableCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

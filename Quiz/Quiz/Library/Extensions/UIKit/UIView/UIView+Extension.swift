//
//  UIView+Extension.swift
//  Quiz
//
//  Created by Andrii Bala on 1/3/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

public extension UIView {
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
        view.scaleEqualSuperView()
    }
    
    func scaleEqualSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superView.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superView.trailingAnchor),
                                     topAnchor.constraint(equalTo: superView.topAnchor),
                                     bottomAnchor.constraint(equalTo: superView.bottomAnchor)])
    }
}

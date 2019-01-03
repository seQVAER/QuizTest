//
//  PopupView.swift
//  Quiz
//
//  Created by Andrii Bala on 1/3/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        hideView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        hideView()
    }
    
    func showView(isCorrect: Bool) {
        isHidden = false
        if isCorrect {
            textLabel.text = "Correct answer!"
            contentView.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.8196078431, blue: 0.2078431373, alpha: 1)
        } else {
            textLabel.text = "Oops! Wrong answer!"
            contentView.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.0431372549, blue: 0.1411764706, alpha: 1)
        }
    }
    
    func hideView() {
        isHidden = true
    }
}

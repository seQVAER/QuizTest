//
//  UIViewController.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension UIViewController {
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

protocol InstantiableFromStoryboard {}

extension InstantiableFromStoryboard where Self: UIViewController {
    static func fromStoryboard(_ name: AppStoryboard, dependence: QuizManager? = nil, bundle: Bundle? = nil) -> Self {
        let identifier = String(describing: self)
        
        guard let viewController = UIStoryboard(name: name.filename, bundle: bundle).instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Cannot instantiate view controller of type " + identifier)
        }
        
        if let dependence = dependence,
            let vc = viewController as? ViewController {
            vc.quizManager = dependence
        }
        
        return viewController
    }
}

extension UIViewController: InstantiableFromStoryboard {}

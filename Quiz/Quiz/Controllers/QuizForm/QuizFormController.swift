//
//  QuizFormController.swift
//  Quiz
//
//  Created by Andrii Bala on 1/2/19.
//  Copyright © 2019 iThinkers. All rights reserved.
//

import UIKit

class QuizFormController: ViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var popupView: PopupView!
    
    var displayCollection: QuizFormViewDisplayCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        
        guard let question = quizManager.question else { return }
        displayCollection = QuizFormViewDisplayCollection(question: question)
        collectionView.registerNibs(from: displayCollection)
        displayCollection.delegate = self
    }
    
    open func configureLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.bounds.size.width
            flowLayout.estimatedItemSize = CGSize(width: width, height: 1)
        }
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        displayCollection.reset()
        popupView.hideView()
    }
    
    @IBAction func nextTap(_ sender: UIButton) {
        guard !displayCollection.isEmptyAnswer() else { return }
        guard displayCollection.displayType == .default else { return }
        let value = displayCollection.next()
        popupView.showView(isCorrect: value)
    }
}

extension QuizFormController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayCollection.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayCollection.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = displayCollection.model(for: indexPath)
        let cell = collectionView.dequeueReusableCell(for: indexPath, with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = displayCollection.header(for: indexPath)
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, with: header)
        return view
    }
}

extension QuizFormController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        displayCollection.didSelect(indexPath: indexPath)
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, layout  collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height = displayCollection.sectionHeaderHeight(in: section)
        let size = CGSize(width: collectionView.frame.width, height: height)
        return size
    }
}

extension QuizFormController: DisplayCollectionDelegate {
    
    func updateUI() {
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    func updateCells(_ indexPaths: [IndexPath]) {
        collectionView.reloadItems(at: indexPaths)
    }
}


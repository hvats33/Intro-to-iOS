//
//  HomeDetailsQuestionsCollectionView.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

protocol HomeDetailsQuestionsCollectionViewDelegate: AnyObject {
    func didSelectOptionA(index: Int)
    func didSelectOptionB(index: Int)
    func didSelectOptionC(index: Int)
    func didSelectOptionD(index: Int)
}

class HomeDetailsQuestionsCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var questions: [QuestionsModel] = []
    weak var delegates: HomeDetailsQuestionsCollectionViewDelegate?
    
    func setCollectionView(arr: [QuestionsModel], delegates: HomeDetailsQuestionsCollectionViewDelegate?) {
        self.delegates = delegates
        self.questions = arr
        self.dataSource = self
        self.delegate = self
        self.reloadWithAnimation(animationDirection: .right)
    }
    func updateValues(arr: [QuestionsModel]) {
        self.questions = arr
        self.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionsListCVC", for: indexPath) as? QuestionsListCVC else {
            fatalError("Cell not found!")
        }
        cell.setUI(data: questions[indexPath.item])
        
        cell.bgOptionA.addTapGesture {
            self.delegates?.didSelectOptionA(index: indexPath.item)
        }
        cell.bgOptionB.addTapGesture {
            self.delegates?.didSelectOptionB(index: indexPath.item)
        }
        cell.bgOptionC.addTapGesture {
            self.delegates?.didSelectOptionC(index: indexPath.item)
        }
        cell.bgOptionD.addTapGesture {
            self.delegates?.didSelectOptionD(index: indexPath.item)
        }
        return cell
    }
    
}
extension HomeDetailsQuestionsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let itemWidth = collectionView.bounds.width
                let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

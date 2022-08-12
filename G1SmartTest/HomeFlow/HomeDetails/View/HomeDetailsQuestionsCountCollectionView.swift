//
//  HomeDetailsQuestionsCountCollectionView.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

class HomeDetailsQuestionsCountCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var arr: [QuestionCountModel] = []
    
    func setCollectionView(arr: [QuestionCountModel]) {
        self.arr = arr
        self.dataSource = self
        self.delegate = self
        self.reloadWithAnimation(animationDirection: .right)
    }
    
    func selectedIndex(index: Int) {
        let mapedValues = arr.enumerated().map { response -> QuestionCountModel in
            var res = response.element
            res.isSelected = false
            if index == response.offset {
                res.isSelected = true
            }
            return res
        }
        self.arr = mapedValues
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionsCountCVC", for: indexPath) as? QuestionsCountCVC else {
            fatalError("Cell not found!")
        }
        cell.configureCell(data: arr[indexPath.row])
        return cell
    }
    
}

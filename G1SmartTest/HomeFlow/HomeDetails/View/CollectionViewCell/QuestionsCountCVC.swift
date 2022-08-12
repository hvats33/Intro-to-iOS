//
//  QuestionsCountCVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

class QuestionsCountCVC: UICollectionViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(data: QuestionCountModel) {
        lblNumber.text = data.title
        bgView.backgroundColor = data.isSelected == true ? UIColor(named: "greenColor") : UIColor.lightGray
    }
}

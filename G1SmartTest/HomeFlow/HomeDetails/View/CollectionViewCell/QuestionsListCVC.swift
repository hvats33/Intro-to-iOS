//
//  QuestionsListCVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 04/08/22.
//

import UIKit

class QuestionsListCVC: UICollectionViewCell {

    //UIView
    @IBOutlet weak var bgOptionA: UIView!
    @IBOutlet weak var bgOptionB: UIView!
    @IBOutlet weak var bgOptionC: UIView!
    @IBOutlet weak var bgOptionD: UIView!
    // UIlable
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblOptionA: UILabel!
    @IBOutlet weak var lblOptionB: UILabel!
    @IBOutlet weak var lblOptionC: UILabel!
    @IBOutlet weak var lblOptionD: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUI(data: QuestionsModel) {
        lblQuestion.text = data.question ?? ""
        lblOptionA.text = data.options?.optionA ?? ""
        lblOptionB.text = data.options?.optionB ?? ""
        lblOptionC.text = data.options?.optionC ?? ""
        lblOptionD.text = data.options?.optionD ?? ""
       
        lblOptionA.textColor = .black
        lblOptionB.textColor = .black
        lblOptionC.textColor = .black
        lblOptionD.textColor = .black
        self.isUserInteractionEnabled = data.isSelected == true ? false : true
        if data.isSelected == true {
            if let selectedValue = data.selectedValue, let answer = data.answer {
                self.selectedOptions(value: selectedValue, answer: answer)
            }
        }
    }
    func selectedOptions(value: Options, answer: Options) {
        switch value {
        case .optionA:
            lblOptionA.textColor = value == answer ? UIColor(named: "blueColor") : UIColor.red
        case .optionB:
            
            lblOptionB.textColor = value == answer ? UIColor(named: "blueColor") : UIColor.red
        case .optionC:
           
            lblOptionC.textColor = value == answer ? UIColor(named: "blueColor") : UIColor.red
        case .optionD:
            
            lblOptionD.textColor = value == answer ? UIColor(named: "blueColor") : UIColor.red
        }
        correctAnswer(answer: answer)
    }
    func correctAnswer(answer: Options) {
        switch answer {
        case .optionA:
            lblOptionA.textColor = UIColor(named: "blueColor")
        case .optionB:
            lblOptionB.textColor = UIColor(named: "blueColor")
        case .optionC:
            lblOptionC.textColor = UIColor(named: "blueColor")
        case .optionD:
            lblOptionD.textColor = UIColor(named: "blueColor")
        }
    }
}

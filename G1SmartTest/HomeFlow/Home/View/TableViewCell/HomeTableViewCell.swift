//
//  HomeTableViewCell.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblNumberOfQuestions: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(data: HomeModel) {
        lblTitle.text = data.title ?? ""
        let numberOfQuestions = data.numberOfQuestions ?? ""
        lblNumberOfQuestions.text = numberOfQuestions + " Question"
        lblTime.text = data.duration ?? ""
    }
}


//
//  NearbyLocationTVC.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 11/08/22.
//

import UIKit

class NearbyLocationTVC: UITableViewCell {

    @IBOutlet weak var clickOnMap: UILabel!
    @IBOutlet weak var lblTimeKM: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: LocationModel) {
        lblTitle.text = data.title
        lblTimeKM.text = data.timeDistance
    }
    
}

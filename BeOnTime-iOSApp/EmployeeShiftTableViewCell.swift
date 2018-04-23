//
//  EmployeeShiftTableViewCell.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmployeeShiftTableViewCell: UITableViewCell {

    
    @IBOutlet var lblCompanyName: UILabel!
    @IBOutlet var lblStartDate: UILabel!
    @IBOutlet var lblEndDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

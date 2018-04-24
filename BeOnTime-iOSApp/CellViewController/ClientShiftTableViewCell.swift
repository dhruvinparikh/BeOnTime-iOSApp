//
//  ClientShiftTableViewCell.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/23/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class ClientShiftTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

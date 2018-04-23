//
//  Workers.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/20/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class Workers {
    
    var workerName:String
    var clientCompany:String
    var workLocation:String
    var jobTitle:String
    var workShift:String
    var shiftStatus:String
    
    //Constructor
    init( workerName:String, clientCompany:String, workLocation:String, jobTitle:String, workShift:String, shiftStatus:String) {

        self.workerName = workerName
        self.clientCompany = clientCompany
        self.workLocation = workLocation
        self.jobTitle = jobTitle
        self.workShift = workShift
        self.shiftStatus = shiftStatus
        
        
    }
    
}




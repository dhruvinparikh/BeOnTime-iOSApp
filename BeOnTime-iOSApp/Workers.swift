//
//  Workers.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/20/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class Workers {
    
    var startDate:String
    var endDate:String
    var workerName:String
    var clientCompany:String
    var workLocation:String
    var jobTitle:String
    var workShift:String
    var shiftStatus:String
    
    //Constructor
    init(startDate:String, endDate:String, workerName:String, clientCompany:String, workLocation:String, jobTitle:String, workShift:String, shiftStatus:String) {
        
        self.startDate = startDate
        self.endDate = endDate
        self.workerName = workerName
        self.clientCompany = clientCompany
        self.workLocation = workLocation
        self.jobTitle = jobTitle
        self.workShift = workShift
        self.shiftStatus = shiftStatus
        
        
    }
    
}




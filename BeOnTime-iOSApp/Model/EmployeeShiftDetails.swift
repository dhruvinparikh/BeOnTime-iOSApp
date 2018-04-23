//
//  EmployeeShiftDetails.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation
class EmployeeShiftDetails{
    var clientCompany:String?
    var workLocation:String?
    var jobTitle:String?
    var workDate:String?
    var workShift:String?
    var shiftStatus:String?
    
    public init (clientCompany:String,workLocation:String,jobTitle:String, workDate:String, workShift:String, shiftStatus:String){
        self.clientCompany = clientCompany
        self.workLocation = workLocation
        self.jobTitle = jobTitle
        self.workDate = workDate
        self.workShift = workShift
        self.shiftStatus = shiftStatus
    }
    
    public init(){
        
    }
}


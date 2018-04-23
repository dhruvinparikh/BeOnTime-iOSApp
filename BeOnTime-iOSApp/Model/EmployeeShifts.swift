//
//  EmployeeShifts.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation
class EmployeeShifts{
    var shiftId:String?
    var companyName:String?
    var startDate:String?
    var endDate:String?
    
    public init (shiftId:String,companyName:String,startDate:String,endDate:String){
        self.shiftId = shiftId
        self.companyName = companyName
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public init(){
        
    }
}

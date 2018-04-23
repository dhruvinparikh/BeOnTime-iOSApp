//
//  EmployeeShifts.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation
class EmployeeShifts{
    var companyName:String?
    var startDate:String?
    var endDate:String?
    
    public init (companyName:String,startDate:String,endDate:String){
        self.companyName = companyName
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public init(){
        
    }
}

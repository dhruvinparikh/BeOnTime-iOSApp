//
//  EmployeeShiftDetails.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation
class EmployeeShiftDetails{
    var companyName:String?
    var startDate:String?
    var endDate:String?
    var address:String?
    var city:String?
    var province:String?
    var postalCode:String?
    var latitude:String?
    var longitude:String?
    var shiftStatus:String?
    
    public init (companyName:String,startDate:String,endDate:String, address:String, city:String, province:String, postalCode:String, latitude:String?, longitude:String?, shiftStatus:String?){
        self.startDate = startDate
        self.endDate = endDate
        self.address = address
        self.city = city
        self.province = province
        self.postalCode = postalCode
        self.latitude = latitude
        self.longitude = longitude
        self.shiftStatus = shiftStatus
    }
    
    public init(){
        
    }
}


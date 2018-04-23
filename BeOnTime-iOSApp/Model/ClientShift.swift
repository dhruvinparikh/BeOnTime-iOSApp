//
//  ClientShift.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/23/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation

class ClientShift {
    var ShiftId: String?
    var UserName: String?
    var FirstName: String?
    var LastName: String?
    var CompanyName: String?
    var payPerHour: String?
    var ShiftEndTime: String?
    var ShiftStartTime: String?
    var ShiftStatus: String?
    var Address: String?
    var City: String?
    var PostalCode: String?
    var empDesignationName: String?
    
    
    public init(ShiftId:String,UserName:String,FirstName:String,LastName:String,CompanyName:String,payPerHour:String,ShiftEndTime:String,ShiftStartTime:String,ShiftStatus:String,Address:String,City:String,PostalCode:String,empDesignationName:String) {
        self.ShiftId = ShiftId
        self.UserName = UserName
        self.FirstName = FirstName
        self.LastName = LastName
        self.CompanyName = CompanyName
        self.payPerHour = payPerHour
        self.ShiftEndTime = ShiftEndTime
        self.ShiftStartTime = ShiftStartTime
        self.ShiftStatus = ShiftStatus
        self.Address = Address
        self.City = City
        self.PostalCode = PostalCode
        self.empDesignationName = empDesignationName
    }
    public init(){
        
    }
}




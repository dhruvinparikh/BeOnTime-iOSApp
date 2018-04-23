//
//  ClientShiftDetails.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/23/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation

class ClientShiftDetail {
    
    var UserName: String?
    var CompanyName: String?
    var FirstName: String?
    var LastName: String?
    var empDesignationName: String?
    var payPerHour: String?
    var ShiftStartTime: String?
    var ShiftEndTime: String?
    var ShiftStatus: String?
    var StarRating: String?
    var ClientReview: String?
    var Address: String?
    var City: String?
    var PostalCode: String?

    
    public init (UserName:String,CompanyName:String,FirstName:String,LastName:String,empDesignationName:String,payPerHour:String,ShiftStartTime:String,ShiftEndTime:String,ShiftStatus:String,StarRating:String,ClientReview:String,Address:String,City:String,PostalCode:String){
        self.UserName = UserName
        self.CompanyName = CompanyName
        self.FirstName = FirstName
        self.LastName = LastName
        self.empDesignationName = empDesignationName
        self.payPerHour = payPerHour
        self.ShiftStartTime = ShiftStartTime
        self.ShiftEndTime = ShiftEndTime
        self.ShiftStatus = ShiftStatus
        self.StarRating = StarRating
        self.ClientReview = ClientReview
        self.Address = Address
        self.City = City
        self.PostalCode = PostalCode
    }
    
    public init(){
        
    }
}



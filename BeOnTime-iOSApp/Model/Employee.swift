//
//  Employee.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 2018-04-22.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation
class Employee{
    var firstName:String?
    var lastName:String?
    var employeeId:Int?
    var email:String?
    var address:String?
    var city:String?
    var province:String?
    var postalCode:String?
    
    public init (firstName:String,lastName:String,employeeId:Int,email:String,address:String,city:String,province:String,postalCode:String){
        self.firstName = firstName
        self.lastName=lastName
        self.city=city
        self.address=address
        self.email=email
        self.employeeId=employeeId
        self.province=province
        self.postalCode=postalCode
    }
    
    public init(){
        
    }
}

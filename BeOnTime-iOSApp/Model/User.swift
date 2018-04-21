//
//  User.swift
//  BeOnTime-iOSApp
//
//  Created by Kamlesh Shah on 2018-04-21.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation

class User{
    var firstname:String
    var lastname:String
    var userId:Int
    var username:String
    var roleId:Int
    var companyId:Int
    
    public init(firstname:String,lastname:String,userId:Int,username:String,roleId:Int,companyId:Int){
        self.firstname=firstname
        self.lastname=lastname
        self.userId=userId
        self.username=username
        self.roleId=roleId
        self.companyId=companyId
    }
    
    public convenience init(){
        self.init(firstname: "", lastname: "", userId: 0, username: "", roleId: 0, companyId: 0)
    }
}

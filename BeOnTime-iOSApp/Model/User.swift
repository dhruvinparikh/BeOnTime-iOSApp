//
//  User.swift
//  BeOnTime-iOSApp
//
//  Created by Kamlesh Shah on 2018-04-21.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import Foundation

class User: NSObject,NSCoding{
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
    
    required convenience init(coder aDecoder: NSCoder) {
        let firstname = aDecoder.decodeObject(forKey: "firstname") as! String
        let lastname = aDecoder.decodeObject(forKey: "lastname") as! String
        let userId = aDecoder.decodeInteger(forKey: "userId")
        let username = aDecoder.decodeObject(forKey:"username") as! String
        let roleId = aDecoder.decodeInteger(forKey:"roleId")
        let companyId = aDecoder.decodeInteger(forKey : "companyId")
        self.init(firstname: firstname, lastname: lastname, userId: userId , username: username, roleId: roleId , companyId: companyId )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstname, forKey: "firstname")
        aCoder.encode(lastname, forKey: "lastname")
        aCoder.encode(userId, forKey: "userid")
        aCoder.encode(username,forKey:"username")
            aCoder.encode(roleId,forKey:"roleId")
        aCoder.encode(companyId,forKey:"companyId")
        
    }
    
    public convenience override init(){
        self.init(firstname: "", lastname: "", userId: 0, username: "", roleId: 0, companyId: 0)
    }
}

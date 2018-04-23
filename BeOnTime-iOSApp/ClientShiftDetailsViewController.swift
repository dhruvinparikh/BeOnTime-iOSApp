//
//  ClientShiftDetailsViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/23/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class ClientShiftDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Reading preferences
        
        let preferences = UserDefaults.standard
        
        
        let companyIdKey = "CompanyId"
        
        let companyId = preferences.string(forKey: companyIdKey)
        
        //-x-x-x-x-x-x-x-x-x-
        
        
        
        //Sending client shift request
        
        let headers = [
            
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            
            "Content-Type": "application/x-www-form-urlencoded",
            
            "Cache-Control": "no-cache"
            
        ]
        
        let postData = NSMutableData(data: "operation=getClientShiftDetails".data(using: String.Encoding.utf8)!)
        
        let cid = "&companyId="+companyId!
        let sid = "&shiftId="+clientShifts[myIndex].ShiftId!;
        postData.append(cid.data(using: String.Encoding.utf8)!)
        postData.append("&startDate=2018-01-22".data(using: String.Encoding.utf8)!)
        postData.append(sid.data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://beontime.byethost16.com/android_project/zf_android_request.php?i=1")! as URL,
                                          
                                          cachePolicy: .useProtocolCachePolicy,
                                          
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        
        request.allHTTPHeaderFields = headers
        
        request.httpBody = postData as Data
        
        
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                
                print(error ?? "Error")
                
            } else {
                
                let httpResponse = response as? HTTPURLResponse
                
                print(httpResponse ?? "No Response")
                
                if let data = data {
                    
                    print(data)
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        //print(json)
                        
                        /***/
                        
                        var dictonary:NSDictionary?
                        
                        do {
                            
                            dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as! NSDictionary
                            
                            
                            
                            if let myDictionary = dictonary
                                
                            {
                                
                                if(myDictionary["success"] as! Int == 1){
                                    
                                    print(myDictionary["shifts"])
                                    
                                    if let clientShiftDetailArray = myDictionary["shifts"]{
                                        
                                        print(clientShiftDetailArray)
                                        
                                        for clientShiftDetailList in (clientShiftDetailArray as? NSArray)!{
                                            
                                            print(clientShiftDetailList)
                                            
                                            if let clientShiftDetail = clientShiftDetailList as? [String: Any]{
                                                
                                                print(clientShiftDetail["Address"])
                                              
                                                DispatchQueue.main.async {
                                                    self.lblName.text="Name : " + String(clientShiftDetail["FirstName"] as! String!) + " " + String(clientShiftDetail["LastName"] as! String!)
                                                    self.lblCompany.text="Company : " + String(clientShiftDetail["CompanyName"] as! String!)
                                                    self.lblLocation.text="Location : " + String(clientShiftDetail["Address"] as! String!)
                                                    self.lblTitle.text="Title : " + String(clientShiftDetail["empDesignationName"] as! String!)
                                                    self.lblStartTime.text="Startime : " + String(clientShiftDetail["ShiftStartTime"] as! String!)
                                                    self.lblEndTime.text="Endtime : " + String(clientShiftDetail["ShiftEndTime"] as! String!)
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                    } }
                                
                            }
                            
                            
                            
                        } catch let error as NSError {
                            
                            print(error)
                            
                        }
                        
                    }
                        
                        /***/
                        
                    catch {
                        
                        print(error)
                        
                    }
                    
                    
                    
                }
                
            }})
        
        
        
        dataTask.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//
//  EmloyeeViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmloyeeViewController: UIViewController {
    
    var userid:String! = ""
    @IBOutlet weak var lblUserid: UILabel!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblShiftid: UILabel!
    @IBOutlet weak var lblWorkingPlace: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    
    @IBAction func btnSearchShift(_ sender: UIButton) {
        let headers = [
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache"
        ]
        
        let postData = NSMutableData(data: "operation=SearchShift".data(using: String.Encoding.utf8)!)
        let id = "&userId="+userid
        postData.append(id.data(using: String.Encoding.utf8)!)
        postData.append("&currentTime=2018-01-25 05:59:00".data(using: String.Encoding.utf8)!)
        
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
                                    //print(myDictionary["CompanyName"])
                                    let name:String! = String(myDictionary["CompanyName"] as! String)
                                    let place:String! = String(myDictionary["WorkingPlace"] as! String)
                                    let id:String! = String(myDictionary["ShiftId"] as! String)
                                    let sTime:String! = String(myDictionary["ShiftStartTime"] as! String)
                                    let eTime:String! = String(myDictionary["ShiftEndTime"] as! String)
                                    DispatchQueue.main.async {
                                        self.lblCompanyName.textColor = UIColor.blue
                                        self.lblCompanyName.text = "Company Name : "+name
                                        self.lblShiftid.textColor = UIColor.blue
                                        self.lblShiftid.text = "Shift id : " + id
                                        self.lblWorkingPlace.textColor = UIColor.blue
                                        self.lblWorkingPlace.text = "Work place : " + place
                                        self.lblStartTime.textColor = UIColor.blue
                                        self.lblStartTime.text = "Start time : " + sTime
                                        self.lblEndTime.textColor = UIColor.blue
                                        self.lblEndTime.text = "End time : " + eTime
                                    }
                                }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Reading preferences
        let preferences = UserDefaults.standard
        
        let useridKey = "userid"
        userid = preferences.string(forKey: useridKey)
        lblUserid.text = userid
        
        lblCompanyName.text = ""
        lblWorkingPlace.text = ""
        lblStartTime.text = ""
        lblEndTime.text = ""
        lblShiftid.text=""
        
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

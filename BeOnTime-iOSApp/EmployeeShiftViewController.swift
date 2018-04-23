//
//  EmployeeShiftViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Vaishnavi Bhagat on 2018-04-23.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmployeeShiftViewController: UIViewController {
 var employeeShift = [EmployeeShifts]()
    
    @IBOutlet var employeeShiftView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.employeeShift.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseEmployeeShiftCell", for: indexPath) as! EmployeeShiftTableViewCell
        cell.lblCompanyName.text = employeeShift[indexPath.row].companyName! + " "
        cell.lblStartDate.text = employeeShift[indexPath.row].startDate!
        cell.lblEndDate.text = employeeShift[indexPath.row].endDate! + " "
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeShiftView.delegate=nil
        employeeShiftView.dataSource=nil
        // Do any additional setup after loading the view.
        
        //Reading preferences
        
        let preferences = UserDefaults.standard
        
        
        
        let userIdkey = "userid"
        
        let userId = preferences.string(forKey: userIdkey)
        
        //-x-x-x-x-x-x-x-x-x-
        
        
        
        //Sending login request
        
        let headers = [
            
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            
            "Content-Type": "application/x-www-form-urlencoded",
            
            "Cache-Control": "no-cache"
            
        ]
        
        let postData = NSMutableData(data: "operation=filterShifts".data(using: String.Encoding.utf8)!)
        
        let uid = "&userId="+userId!
        
        postData.append(uid.data(using: String.Encoding.utf8)!)
        postData.append("&startDate=2018-01-22".data(using: String.Encoding.utf8)!)
        postData.append("&endDate=2018-01-26".data(using: String.Encoding.utf8)!)
        
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
                                    
                                   // print(myDictionary["shifts"] ?? 10002)
                                
                                    if let employeeShiftArray = myDictionary["employeeShift"]{
                                        
                                        //print(employeeShiftArray)
                                        
                                        for employeeShiftlist in (employeeShiftArray as? NSArray)!{
                                            
                                            //print(employeeShiftlist)
                                            
                                            if let employeeshift = employeeShiftlist as? [String: Any]{
                                                
                                                print(employeeshift["shiftId"] ?? 10002)
                                                
                                                let shift = EmployeeShifts()
                                                
                                                shift.shiftId = employeeshift["shiftId"] as? String
                                                
                                                shift.companyName = employeeshift["companyName"] as? String
                                                
                                                shift.startDate = employeeshift["startDate"] as? String
                                                
                                                shift.endDate = employeeshift["endDate"] as? String
                                                
                                               
                                                
                                                self.employeeShift.append(shift)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    DispatchQueue.main.async {
                                        self.employeeShiftView.dataSource = self as? UITableViewDataSource
                                        self.employeeShiftView.delegate = self as? UITableViewDelegate
                                        self.employeeShiftView.reloadData()
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

        // Do any additional setup after loading the view.
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

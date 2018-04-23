//
//  ClientShiftViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/23/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit



class ClientShiftViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var clientShiftView: UITableView!
    var clientShifts = [ClientShift]()
    @IBAction func btnLogout(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clientShifts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientSiftCell", for: indexPath) as! ClientShiftTableViewCell
        
        //Configure cell
        
        cell.lblName.text = clientShifts[indexPath.row].CompanyName
        cell.lblStartTime.text = clientShifts[indexPath.row].ShiftStartTime
        cell.lblEndTime.text = clientShifts[indexPath.row].ShiftEndTime
        
        return cell
    }
    @IBAction func btnSearch(_ sender: UIButton) {
        //Reading preferences
        
        let preferences = UserDefaults.standard
        
        
        
        let companyIdKey = "CompanyId"
        
        let companyId = preferences.string(forKey: companyIdKey)
        
        //-x-x-x-x-x-x-x-x-x-
        
        
        
        //Sending login request
        
        let headers = [
            
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            
            "Content-Type": "application/x-www-form-urlencoded",
            
            "Cache-Control": "no-cache"
            
        ]
        
        let postData = NSMutableData(data: "operation=getClientShifts".data(using: String.Encoding.utf8)!)
        
        let cid = "&companyId="+companyId!
        
        postData.append(cid.data(using: String.Encoding.utf8)!)
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
                                    
                                    //print(myDictionary["shifts"])
                                    
                                    if let clientShiftArray = myDictionary["shifts"]{
                                        
                                        //print(clientShiftArray)
                                        
                                        for clientShiftList in (clientShiftArray as? NSArray)!{
                                            
                                            print(clientShiftList)
                                            
                                            if let clientShift = clientShiftList as? [String: Any]{
                                                
                                                //print(clientShift["Address"])
                                                
                                                
                                                let shift = ClientShift()
                                                
                                                shift.Address = clientShift["Address"] as? String
                                                shift.City = clientShift["City"] as? String
                                                shift.CompanyName = clientShift["CompanyName"] as? String
                                                shift.FirstName = clientShift["FirstName"] as? String
                                                shift.LastName = clientShift["LastName"] as? String
                                                shift.PostalCode = clientShift["PostalCode"] as? String
                                                shift.ShiftEndTime = clientShift["ShiftEndTime"] as? String
                                                shift.ShiftId = clientShift["ShiftId"] as? String
                                                shift.ShiftStartTime = clientShift["ShiftStartTime"] as? String
                                                shift.ShiftStatus = clientShift["ShiftStatus"] as? String
                                                shift.UserName = clientShift["UserName"] as? String
                                                shift.empDesignationName = clientShift["empDesignationName"] as? String
                                                shift.payPerHour = clientShift["payPerHour"] as? String
                                                
                                                self.clientShifts.append(shift)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    DispatchQueue.main.async {
                                        self.clientShiftView.dataSource = self
                                        self.clientShiftView.delegate = self
                                        self.clientShiftView.reloadData()
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.clientShiftView.dataSource = nil
        self.clientShiftView.delegate=nil
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

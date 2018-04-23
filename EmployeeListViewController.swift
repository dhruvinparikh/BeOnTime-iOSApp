//
//  EmployeeListViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 2018-04-22.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var employees = [Employee]()
    
    @IBOutlet weak var employeeView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.employees.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseEmployeeCell", for: indexPath) as! EmployeeTableViewCell
        cell.lblName.text = employees[indexPath.row].firstName! + " " + employees[indexPath.row].lastName! + ", " + employees[indexPath.row].employeeId!
        cell.lblEmail.text = employees[indexPath.row].email!
        cell.lblAddress.text = employees[indexPath.row].address! + "," + employees[indexPath.row].city! + "-" + employees[indexPath.row].postalCode! + ", "+employees[indexPath.row].province!+"."
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeView.delegate=nil
        employeeView.dataSource=nil
        // Do any additional setup after loading the view.
        
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
        
        let postData = NSMutableData(data: "operation=getEmployeeList".data(using: String.Encoding.utf8)!)
        
        let cid = "&companyId="+companyId!
        
        postData.append(cid.data(using: String.Encoding.utf8)!)
        
        
        
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
                                    
                                    //print(myDictionary["employees"])
                                    
                                    if let employeeArray = myDictionary["employees"]{
                                        
                                        //print(employeeArray)
                                        
                                        for employeelist in (employeeArray as? NSArray)!{
                                            
                                            //print(employeelist)
                                            
                                            if let employee = employeelist as? [String: Any]{
                                                
                                                print(employee["firstName"])
                                                
                                                let emp = Employee()
                                                
                                                emp.firstName = employee["firstName"] as? String
                                                
                                                emp.lastName = employee["lastName"] as? String
                                                
                                                emp.employeeId = employee["employeeId"] as? String
                                                
                                                emp.email = employee["email"] as? String
                                                
                                                emp.address = employee["address"] as? String
                                                
                                                emp.city = employee["city"] as? String
                                                
                                                emp.province = employee["province"] as? String
                                                
                                                emp.postalCode = employee["postalCode"] as? String
                                                
                                                self.employees.append(emp)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    DispatchQueue.main.async {
                                        self.employeeView.dataSource = self
                                        self.employeeView.delegate = self
                                        self.employeeView.reloadData()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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

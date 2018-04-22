//
//  EmployeeViewTableViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmployeeViewTableViewController: UITableViewController{
    
    @IBOutlet var employeeView: UITableView!
    var employees = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeView.delegate=nil
        employeeView.dataSource=nil
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
                                            }
                                        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

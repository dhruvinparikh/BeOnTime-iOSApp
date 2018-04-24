//
//  LoginViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit
//update cookie here from http://www.beontime.byethost16.com/android_project/getcookie.php?i=1


var BYETHOST_COOKIE_KEY = "e0425930eb12c3a457bd60eed3dd5126";
class LoginViewController: UIViewController {
    
    //Object created for username text field on login
    @IBOutlet weak var tfUsername: UITextField!
    //Object created for password text field on login
    @IBOutlet weak var tfPassword: UITextField!
    //Object created for error on login failure
    @IBOutlet weak var lblError: UILabel!
    //Action Event to fire when user clicks login
    @IBAction func btnLogin(_ sender: UIButton) {
        /*
         Here put the code for extract username password and authenticate with remote PHP web service
         */
        
        //test code for switching view controllers
        //Instantiating storyboard instance
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //create object of the intented view controller to be diplayed
        let employeeViewController = storyBoard.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmloyeeViewController
        
        /********Writing preferences Sample************
         let preferences = UserDefaults.standard
         let currentLevel = "test string"
         let currentLevelKey = "currentLevel"
         preferences.set(currentLevel, forKey: currentLevelKey)
         preferences.synchronize()
         *************/
        /*
         Role id    Role
         10         Manager
         11         Client
         12         Employee
         */
        //Sending login request
        let headers = [
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache"
        ]
        let login = Login(username: tfUsername.text!, password: tfPassword.text!)
        let postData = NSMutableData(data: "operation=LoginAuthentication".data(using: String.Encoding.utf8)!)
        let username = "&username="+login.username!
        let password = "&password="+login.password!
        postData.append(username.data(using: String.Encoding.utf8)!)
        postData.append(password.data(using: String.Encoding.utf8)!)
        
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
                                    /*DispatchQueue.main.async {
                                     let user = User(firstname: myDictionary["firstName"] as! String, lastname: myDictionary["lastName"] as! String, userId: myDictionary["userId"] as! Int, username: myDictionary["username"] as! String, roleId: myDictionary["roleId"] as! Int, companyId: myDictionary["CompanyId"] as! Int)
                                     //Writing custom object to NSDefaults
                                     var userDefaults = UserDefaults.standard
                                     let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
                                     userDefaults.set(encodedData, forKey: "user")
                                     userDefaults.synchronize()
                                     }*/
                                    let preferences = UserDefaults.standard
                                    let companyId = myDictionary["CompanyId"]
                                    let companyIdKey = "CompanyId"
                                    let firstname = myDictionary["firstName"]
                                    let firstnameKey = "firstname"
                                    let lastname = myDictionary["lastName"]
                                    let lastnameKey = "lastname"
                                    let userid = myDictionary["userId"]
                                    let useridKey = "userid"
                                    preferences.set(companyId, forKey: companyIdKey)
                                    preferences.set(firstname, forKey: firstnameKey)
                                    preferences.set(lastname, forKey: lastnameKey)
                                    preferences.set(userid, forKey: useridKey)
                                    preferences.synchronize()
                                    switch((myDictionary["roleId"] as! NSString).intValue)
                                    {
                                    case 10://Manager
                                        //Updating UI on a thread other than the main thread is a common mistake that can result in missed UI updates, visual defects, data corruptions, and crashes.
                                        //tasks such as networking are often executed in the background, and provide a completion handler to signal completion. Attempting to read or update the UI from a completion handler may cause problems.
                                        //Dispatch the call to update the UI.
                                        DispatchQueue.main.async {
                                            
                                            self.performSegue(withIdentifier: "toManagerViewController", sender: nil)
                                        }
                                        break;
                                    case 11://Client
                                        DispatchQueue.main.async {
                                            self.performSegue(withIdentifier: "totest", sender: nil)
                                        }
                                        
                                        break;
                                    case 12://Employee
                                        DispatchQueue.main.async {
                                            //self.present(employeeViewController, animated: true, completion: nil)
                                            self.performSegue(withIdentifier: "toEmployeeNavigationController", sender: nil)
                                            }
                                        break;
                                    default:
                                        break;
                                    }
                                }
                                else{
                                    DispatchQueue.main.async {
                                        self.lblError.text="Username password combination incorrect"
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        clear();
    }
    
    
    //function to clear login credentials field
    
    func clear(){
        tfPassword.text="";
        tfUsername.text="";
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

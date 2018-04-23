////
////  EmployeeShiftViewController.swift
////  BeOnTime-iOSApp
////
////  Created by Vaishnavi Bhagat on 2018-04-23.
////  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
////
//
import UIKit
//
class EmployeeShiftViewController: UIViewController {
//
//     var userid:String! = ""
//    var startDate:String! = ""
//    var endDate:String! = ""
//    @IBAction func searchShifts(_ sender: Any) {
//        let headers = [
//            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
//            "Content-Type": "application/x-www-form-urlencoded",
//            "Cache-Control": "no-cache"
//        ]
//        
//        let postData = NSMutableData(data: "operation=filterShifts".data(using: String.Encoding.utf8)!)
//        let id = "&userId="+userid
//        let start = "&startDate="+startDate
//        let end = "&endDate="+endDate
//        postData.append(id.data(using: String.Encoding.utf8)!)
//        postData.append("&currentTime=2018-01-25 05:59:00".data(using: String.Encoding.utf8)!)
//        
//        let request = NSMutableURLRequest(url: NSURL(string: "http://beontime.byethost16.com/android_project/zf_android_request.php?i=1")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as Data
//        
////        let session = URLSession.shared
////        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
////            if (error != nil) {
////                print(error ?? "Error")
////            } else {
////                let httpResponse = response as? HTTPURLResponse
////                print(httpResponse ?? "No Response")
////                if let data = data {
////                    print(data)
////                    do {
////                        let json = try JSONSerialization.jsonObject(with: data, options: [])
////                        //print(json)
////                        /***/
////                        var dictonary:NSDictionary?
////                        do {
////                            dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as! NSDictionary
////
////                            if let myDictionary = dictonary
////                            {
////                                if(myDictionary["success"] as! Int == 1){
////
////                                    }
////                                }
////                            }
////
////                        } catch let error as NSError {
////                            print(error)
////                        }
////                    }
////                        /***/
////                    catch {
////                        print(error)
////                    }
////
////                }
////
////            }})
////
////        dataTask.resume()
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
}


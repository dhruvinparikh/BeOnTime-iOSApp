//
//  ManagerViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit
import MapKit

class ManagerViewController: UIViewController {

    //Created object for user greet label
    @IBOutlet weak var lblUser: UILabel!
    //Created object for user's company ID
    @IBOutlet weak var lblCompanyId: UILabel!
    //Created object for map item to display location of employee working
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func btnLogout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Reading preferences
        let preferences = UserDefaults.standard
        
        let companyIdKey = "CompanyId"
        let companyId = preferences.string(forKey: companyIdKey)
        lblUser.text = "Hello " + preferences.string(forKey: "firstname")! + " " + preferences.string(forKey: "lastname")!
        lblCompanyId.text = companyId
        
        //--Setting mapview properties-------
        // define location to show in the map
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.702194, -79.569515)
        // defining area spanned by region
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1,0.1)
        // define region
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        // set the region
        mapView.setRegion(region, animated:true)
        // Annotation
        var arrAnnotation = [MKPointAnnotation]()
        //-x-x-x-x-x-x-//
        
        //Creating a post request
        let headers = [
            "Cookie": "__test="+BYETHOST_COOKIE_KEY+"; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache"
        ]
        
        let postData = NSMutableData(data: "operation=getEmployeePosition".data(using: String.Encoding.utf8)!)
        let cid = "&companyId="+companyId!
        postData.append(cid.data(using: String.Encoding.utf8)!)
        postData.append("&currentTime=2018-01-22".data(using: String.Encoding.utf8)!)

        
        let request = NSMutableURLRequest(url: NSURL(string: "http://beontime.byethost16.com/android_project/zf_android_request.php?i=1")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                //print(error ?? "Error")
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse ?? "No Response")
                if let data = data {
                    //print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        //print(json)
                        /***/
                        var dictonary:NSDictionary?
                        do {
                            dictonary = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject] as! NSDictionary
                            
                            if let myDictionary = dictonary
                            {
                                if(myDictionary["success"] as! Int == 1){
                                    //print(data)
                                    if let positions = myDictionary["positions"]{
                                        for position in (positions as? NSArray)!{
                                            if let singleposition = position as? [String:Any]{
                                                var c:String! = singleposition["CompanyName"] as! String
                                                let lat:Double! = Double(singleposition["CurrentLat"] as! String)
                                                let lng:Double! = Double(singleposition["CurrentLong"] as! String)
                                                let pos:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
                                                DispatchQueue.main.async {
                                                    /*var lat:CLLocationDegrees = singleposition["CurrentLat"] as! CLLocationDegrees
                                                    var lng:CLLocationDegrees = singleposition["CurrentLong"] as! CLLocationDegrees*/
                                                /*let pos:CLLocationCoordinate2D = CLLocationCoordinate2DMake(singleposition["CurrentLat"] as! CLLocationDegrees, singleposition["CurrentLong"] as! CLLocationDegrees)*/
                                                /*let annotation = MKPointAnnotation()
                                                annotation.coordinate = pos
                                                let name = String(describing: singleposition["FirstName"]) + " " + String(describing: singleposition["LastName"])
                                                annotation.title = name
                                                let company = String(describing: singleposition["CompanyName"])
                                                annotation.subtitle=company
                                                self.mapView.addAnnotation(annotation)*/
                                                }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

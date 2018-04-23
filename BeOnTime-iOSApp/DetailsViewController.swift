//
//  DetailsViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/20/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblWorkerName: UILabel!
    @IBOutlet weak var lblClientCompany: UILabel!
    @IBOutlet weak var lblWorkLocation: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var lblWorkShift: UILabel!
    @IBOutlet weak var lblShiftStatus: UILabel!
    @IBOutlet weak var textViewRemark: UITextView!
    
    @IBAction func btnCancel(_ sender: Any) {
        var alertController = UIAlertController(title: "Confirm", message: "Are you sure you want to cancel your request?", preferredStyle: UIAlertControllerStyle.actionSheet);
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
            print("Cancel pressed successfully")
            
        }
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
        
    
    @IBAction func btnSave(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //create object of the intented view controller to be diplayed
        _ = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        let headers = [
            "Cookie": "; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache",
            "Postman-Token": "20674dea-bdb8-4438-9832-e9b115b3743d"
        ]
        
       // let url = NSURL(string: "") // our database server string goes here...
    
        let dateFormatter = DateFormatter()
        var date:Date?
        
        _ = Workers(workerName: lblWorkerName.text!, clientCompany: lblClientCompany.text!, workLocation: lblWorkLocation.text!, jobTitle: lblJobTitle.text!, workShift: lblWorkShift.text!, shiftStatus: lblShiftStatus.text!)
        let postData = NSMutableData(data: "operation=getClientShiftDetails".data(using: String.Encoding.utf16)!)
        
        let StartDate = "&StartDate" + dateFormatter.string(from: date!)
        let EndDate = "&EndDate" + dateFormatter.string(from: date!)
        
        postData.append(StartDate.data(using: String.Encoding.utf16)!)
        postData.append(EndDate.data(using:String.Encoding.utf16)!)
       // postData.append(workers.data(using:String.Encoding,UTF16)!)
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://beontime.byethost16.com/android_project/zf_android_request.php?i=1")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
     
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Save Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have the necessary connection?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse ?? "No Response")
                    if let data = data {
                        print(data)
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print(json)
                            /***/
                            var dictonary:NSDictionary?
                            do {
                                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as! NSDictionary
                                
                                if let myDictionary = dictonary
                                {
                                    if(myDictionary["success"] as! Int == 1){
                                        let preferences = UserDefaults.standard
                                        let companyId = myDictionary["CompanyId"]
                                        let companyIdKey = "CompanyId"
                                        let shiftId = myDictionary["ShiftId"]
                                        let shiftIdKey = "shiftId"
                                        preferences.set(companyId, forKey: companyIdKey)
                                        preferences.set(shiftId, forKey: shiftIdKey)
                                        preferences.synchronize()
                                    }
                                    else{
                                        DispatchQueue.main.async {
                                            
                                            let alert = UIAlertController(title: "Save Didn't Work", message: "Looks like the insert into the database did not work properly...", preferredStyle: .alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                            self.present(alert, animated: true, completion: nil)
                                        }
                                    }
                                }
                                
                            } catch let error as NSError {
                                print(error)
                            }
                        }
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
        clear();
    }
    
    func clear(){
        self.clear()
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


//
//  ShiftViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/20/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class ShiftViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {

    var workers = [Workers(workerName:"Emre Ozel", clientCompany: "Humber",  workLocation: "Toronto",jobTitle:"Programmer", workShift:"2", shiftStatus:"Active" )]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return workers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1")
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")

      // cell.textLabel?.text = workers[indexPath.row]
        
        return cell
        return cell1!
        return cell2!
        
      //  let worker = workers[indexPath.row]
      //  cell.lblName.text = worker.movieTitle
       // cell.lblYear.text = worker.year
       // cell.myImage.image = UIImage(named: movie.imageAddress)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Setting myindex to the row number
        myIndex = indexPath.row
        //Performing Segue
        performSegue(withIdentifier: "segue", sender: self)
    }
    
 
    @IBOutlet weak var PickerStart: UIDatePicker!
    @IBOutlet weak var PickerEnd: UIDatePicker!
    @IBOutlet weak var lblCheck: UILabel!

    
    @IBAction func btnSearch(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //create object of the intented view controller to be diplayed
        _ = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
    
        let headers = [
            "Cookie": "; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/",
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache",
            "Postman-Token": "20674dea-bdb8-4438-9832-e9b115b3743d"
        ]
        let dateFormatter = DateFormatter()
        var date:Date?
        //dateFormatter.dateStyle = DateFormatter.Style.short
        //dateFormatter.timeStyle = DateFormatter.Style.short
        
      //  let strDate = dateFormatter.string(from: datePicker.date)
        _ = Shift(StartDate: PickerStart.date, EndDate: PickerEnd.date)
         let postData = NSMutableData(data: "operation=getClientShifts".data(using: String.Encoding.utf16)!)
        let postData1 = NSMutableData(data: "operation= filterShifts".data(using: String.Encoding.utf16)!)

        let StartDate = "&StartDate" + dateFormatter.string(from: date!)
        let EndDate = "&EndDate" + dateFormatter.string(from: date!)
        
        postData.append(StartDate.data(using: String.Encoding.utf16)!)
        postData.append(EndDate.data(using:String.Encoding.utf16)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://beontime.byethost16.com/android_project/zf_android_request.php?i=1")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        request.httpBody = postData1 as Data
        
       // let session = URLSession.shared
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "Error")
            } else {
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
                                    let start = myDictionary["StartTime"]
                                    let startkey = "StartDate"
                                    let end = myDictionary["EndTime"]
                                    let endkey = "EndDate"
                                    preferences.set(companyId, forKey: companyIdKey)
                                    preferences.set(start, forKey: startkey)
                                    preferences.set(end, forKey: endkey)
                                    preferences.synchronize()
    }
                                else{
                                    DispatchQueue.main.async {
                                        self.lblCheck.text="Either start or end date or both have not been selected yet..."
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

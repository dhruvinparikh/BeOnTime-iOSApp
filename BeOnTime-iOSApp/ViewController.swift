//
//  ViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Ozel Emre on 4/20/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

var workers = [Workers(startDate: "11.11.2013", endDate: "11.11.2015",workerName:"Emre Ozel", clientCompany: "Humber",  workLocation: "Toronto",jobTitle:"Programmer", workShift:"2", shiftStatus:"Active" )]

var myIndex = 0


import UIKit


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell")! as! TableViewCell
        let worker = workers[indexPath.row]
        cell.datePickerStartDate(worker.startDate)
        
        cell.datepickerEndDate(worker.endDate)
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
    
    
    //Method for selct a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Setting myindex to the row number
        myIndex = indexPath.row
        //Performing Segue
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
    }
    }
    
    






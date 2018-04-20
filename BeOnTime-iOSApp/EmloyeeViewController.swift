//
//  EmloyeeViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class EmloyeeViewController: UIViewController {

    @IBOutlet weak var lblUserid: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Reading preferences
        let preferences = UserDefaults.standard
        
        let currentLevelKey = "currentLevel"
        let currentLevel = preferences.string(forKey: currentLevelKey)
        
        lblUserid.text = currentLevel
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
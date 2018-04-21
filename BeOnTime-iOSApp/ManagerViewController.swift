//
//  ManagerViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    //Created object for user greet label
    @IBOutlet weak var lblUser: UILabel!
    //Created object for user's company ID
    @IBOutlet weak var lblCompanyId: UILabel!
    @IBAction func btnLogout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Reading preferences
        let preferences = UserDefaults.standard
        
        let currentLevelKey = "CompanyId"
        let currentLevel = preferences.string(forKey: currentLevelKey)
        lblUser.text = "Hello " + preferences.string(forKey: "firstname")! + " " + preferences.string(forKey: "lastname")!
        lblCompanyId.text = currentLevel
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

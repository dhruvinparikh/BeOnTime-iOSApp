//
//  LoginViewController.swift
//  BeOnTime-iOSApp
//
//  Created by Parikh Dhruvin S. on 4/17/18.
//  Copyright © 2018 Parikh Dhruvin S. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Object created for username text field on login
    @IBOutlet weak var tfUsername: UITextField!
    //Object created for password text field on login
    @IBOutlet weak var tfPassword: UITextField!
    
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
        
        //Writing preferences
        let preferences = UserDefaults.standard
        let currentLevel = "test string"
        let currentLevelKey = "currentLevel"
        preferences.set(currentLevel, forKey: currentLevelKey)
        preferences.synchronize()
        
        
        if(tfUsername.text == "employee"){
            //self.dismiss(animated: true, completion: nil)
            self.present(employeeViewController, animated: true, completion: nil)
        }
        else if(tfUsername.text == "manager"){
            performSegue(withIdentifier: "toManagerViewController", sender: nil)
        }
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

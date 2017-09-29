//
//  ProfileViewController.swift
//  InClass04
//
//  Created by Ayyanchira, Akshay Murari on 9/28/17.
//  Copyright © 2017 Ayyanchira, Akshay Murari. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    private var isPasswordVisible = false
    public var student:Student?
    
    @IBAction func showPasswordButtonPressed(_ sender: UIButton) {
        isPasswordVisible = !(isPasswordVisible)
        showPassword()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = student?.name
        emailLabel.text = student?.emailid
        //passwordLabel.text = student?.password
        showPassword()
        departmentLabel.text = student?.department
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPassword(){
        if isPasswordVisible {
            passwordLabel.text = student?.password
        }
        else{
            var password = passwordLabel.text
            
            passwordLabel.text = "******"
        }
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

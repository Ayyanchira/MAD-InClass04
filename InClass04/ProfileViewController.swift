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
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var isPasswordVisible = false
    public var student:Student?
    
    @IBAction func showPasswordButtonPressed(_ sender: UIButton) {
        isPasswordVisible = !(isPasswordVisible)
        updatePasswordVisibility()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isPasswordVisible = false
        nameTextField.text = student?.name
        emailLabel.text = student?.emailid
        passwordTextField.text = student?.password
        departmentLabel.text = student?.department
        updatePasswordVisibility()
    }
    
    func updatePasswordVisibility(){
        if isPasswordVisible {
            passwordTextField.isSecureTextEntry = false
        }
        else{
            passwordTextField.isSecureTextEntry = true
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as? EditProfileViewController
        editViewController?.condition = segue.identifier
        editViewController?.parentView = self
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

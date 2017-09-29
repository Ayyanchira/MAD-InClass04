//
//  ViewController.swift
//  InClass04
//
//  Created by Ayyanchira, Akshay Murari on 9/28/17.
//  Copyright © 2017 Ayyanchira, Akshay Murari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var departmentSegmentedControl: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var status = false
        if let name = nameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text{
            if (name != "") && (email != "") && (password != ""){
                status = true
            }
            else{
               showAlertMessage()
            }
        }
        
        return status
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare for segue called")
        if segue.identifier == "profileViewSegue" {
            if let name = nameTextField.text,
                let email = emailTextField.text,
                let password = passwordTextField.text{
                
                if (name != "") && (email != "") && (password != ""){
                    let student = Student(name: name, password: password, email: email, department: departmentSegmentedControl.titleForSegment(at: departmentSegmentedControl.selectedSegmentIndex)!)
                    let profileViewController = segue.destination as! ProfileViewController
                    profileViewController.student = student
                }
                else{
                    showAlertMessage()
                }
                
            }
            else{
                showAlertMessage()
            }
            
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        print("Perform segue called")
        
        
    }
    
    func showAlertMessage(){
        let alert = UIAlertController(title: "Blank Fields", message: "Please enter all the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


//
//  EditProfileViewController.swift
//  InClass04
//
//  Created by Ayyanchira, Akshay Murari on 9/28/17.
//  Copyright © 2017 Ayyanchira, Akshay Murari. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    public var condition:String?
    public var parentView:Any?
    
    @IBOutlet weak var studentEditTextField: UITextField!
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var departmentSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let segue = condition{
            switch segue {
            case "nameEditSegue":
                editLabel.text = "Name"
                studentEditTextField.isHidden = false
                departmentSegment.isHidden = true
            case "passwordEditSegue":
                editLabel.text = "Password"
                studentEditTextField.isHidden = false
                studentEditTextField.isSecureTextEntry = true
                departmentSegment.isHidden = true
            case "departmentEditSegue":
                editLabel.text = "Department"
                studentEditTextField.isHidden = true
                departmentSegment.isHidden = false
            case "emailEditSegue":
                editLabel.text = "Email"
                studentEditTextField.isHidden = false
                departmentSegment.isHidden = true
            default:
                print("default case executed")
            }
        }
        
        // Do any additional setup after loading the view.
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

    @IBAction func updateButtonPressed(_ sender: UIButton) {
        if studentEditTextField.text != "" || !departmentSegment.isHidden {
            let parentVC = parentView as? ProfileViewController
            let student = parentVC?.student
            
            if let segue = condition{
                switch segue {
                case "nameEditSegue":
                    student?.name = studentEditTextField.text!
                case "passwordEditSegue":
                    student?.password = studentEditTextField.text!
                case "departmentEditSegue":
                    student?.department = departmentSegment.titleForSegment(at: departmentSegment.selectedSegmentIndex)!
                case "emailEditSegue":
                    student?.emailid = studentEditTextField.text!
                default:
                    print("default case executed")
                }
            }
            parentVC?.student = student
            self.dismiss(animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Blank Fields", message: "Please enter the values", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

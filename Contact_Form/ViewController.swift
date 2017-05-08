//
//  ViewController.swift
//  Contact_Form
//
//  Created by Hayden Goldman on 5/8/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameTextField.delegate = self
        self.titleTextField.delegate = self
        self.companyTextField.delegate = self
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        self.nameLabel.text = "Hayden Goldman \n iOS Developer"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        self.addContact()
        
        
        
        let alert = UIAlertController(title: "Thank You!", message: "I appreciate you stopping by. Eat more tacos!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "🌮", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
            self.nameTextField.text = ""
            self.titleTextField.text = ""
            self.companyTextField.text = ""
            self.emailTextField.text = ""
            self.phoneTextField.text = ""
            })
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func addContact() {
        
        let ref = FIRDatabase.database().reference().childByAutoId()

        let contact = Contact()
        contact.name = self.nameTextField.text
        contact.company = self.companyTextField.text
        contact.title = self.titleTextField.text
        contact.email = self.emailTextField.text
        contact.phoneNumber = self.phoneTextField.text
        
        ref.setValue(contact.toDictionary())
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}


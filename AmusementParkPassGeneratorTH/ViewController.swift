//
//  ViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables and constants
    
    var datePicker: DatePicker?
    
    //MARK: Outlets
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var projectTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var entrantStackView: UIStackView!
    @IBOutlet weak var stackButton1: UIButton!
    @IBOutlet weak var stackButton2: UIButton!
    @IBOutlet weak var stackButton3: UIButton!
    @IBOutlet weak var stackButton4: UIButton!
    @IBOutlet weak var stackButton5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = DatePicker(forTextField: dateOfBirthTextField)
        dateOfBirthTextField.delegate = self
    }
    
    func resign() {
        dateOfBirthTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        ssnTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        projectTextField.resignFirstResponder()
        streetTextField.resignFirstResponder()
        companyTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        zipTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        entrantStackView.resignFirstResponder()
        stackButton1.resignFirstResponder()
        stackButton2.resignFirstResponder()
        stackButton3.resignFirstResponder()
        stackButton4.resignFirstResponder()
        stackButton5.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dateOfBirthTextField {
            resign()
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            let initDate: Date? = formatter.date(from: dateOfBirthTextField.text!)
            
            let dateChangedCallback : DatePicker.DatePickerCallback = {(newDate : Date, forTextField : UITextField) -> () in
                forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
            }
            datePicker?.pick(self, initDate: initDate, dataChanged: dateChangedCallback)
            return false
        } else {
            return true
        }
    }
    
    @IBAction func GeneratePassPressed(_ sender: UIButton) {
        createAlert()
    }
    
    
    func createAlert() {
        let alertView = UIAlertController(title: "TEST", message: "This is a message!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        present(alertView, animated: true, completion: nil)
    }
}

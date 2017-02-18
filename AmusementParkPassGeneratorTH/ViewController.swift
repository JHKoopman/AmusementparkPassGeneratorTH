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
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    var classicGuest: [String:[UITextField]]!
    var VIPGuest: [String:[UITextField]]!
    var childGuest: [String:[UITextField]]!
    var employee: [String:[UITextField]]!
    var manager: [String:[UITextField]]!
    var seasonPassGuest: [String:[UITextField]]!
    var seniorGuest: [String:[UITextField]]!
    var vendor: [String:[UITextField]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classicGuest = ["Needed":[], "NotNeeded":[]]
        VIPGuest = ["Needed":[], "NotNeeded":[]]
        childGuest = ["Needed":[], "NotNeeded":[]]
        employee = ["Needed":[], "NotNeeded":[]]
        manager = ["Needed":[], "NotNeeded":[]]
        seasonPassGuest = ["Needed":[], "NotNeeded":[]]
        seniorGuest = ["Needed":[], "NotNeeded":[]]
        vendor = ["Needed":[], "NotNeeded":[]]
        datePicker = DatePicker(forTextField: dateOfBirthTextField)
        dateOfBirthTextField.delegate = self
        employeeButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        managerButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        vendorButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
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
    @IBAction func catButtonPressed(_ sender: UIButton) {
        sender.titleLabel?.textColor = UIColor.white
        switch sender {
        case guestButton:
            employeeButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            managerButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            vendorButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        case employeeButton:
            guestButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            managerButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            vendorButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        case managerButton:
            employeeButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            guestButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            vendorButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        case vendorButton:
            employeeButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            guestButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
            managerButton.titleLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        default:
            print("Something went wrong! OOPS!")
        }
    }
    
    
    func createAlert() {
        let alertView = UIAlertController(title: "TEST", message: "This is a message!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        present(alertView, animated: true, completion: nil)
    }
}

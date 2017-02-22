//
//  ViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, createNewPassDelegate, errorHandler {
    
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
    
    var classicGuest: [UITextField]!
    var VIPGuest: [UITextField]!
    var childGuest: [UITextField]!
    var employee: [UITextField]!
    var manager: [UITextField]!
    var seasonPassGuest: [UITextField]!
    var seniorGuest: [UITextField]!
    var vendor: [UITextField]!
    var contractEmployee: [UITextField]!
    var allTextFields: [UITextField]!
    var category: String = "Guest"
    var entrantType: EntrantType = .Child
    let projectNumbers = [1001, 1002, 1003, 2001, 2002]
    let vendorCompanys = ["Acme", "Orkin", "Fedex", "NW Electrical"]
    var dateOfBirth: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTextFields = [dateOfBirthTextField, firstNameTextField, ssnTextField, stateTextField, projectTextField, streetTextField, companyTextField, lastNameTextField, zipTextField, cityTextField]
        classicGuest = [firstNameTextField, lastNameTextField]
        VIPGuest = [firstNameTextField, lastNameTextField]
        childGuest = [firstNameTextField, lastNameTextField, dateOfBirthTextField]
        employee = [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipTextField]
        manager = [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipTextField]
        seasonPassGuest = [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipTextField]
        seniorGuest = [firstNameTextField, lastNameTextField, dateOfBirthTextField]
        vendor = [firstNameTextField, lastNameTextField, companyTextField, dateOfBirthTextField]
        contractEmployee = [firstNameTextField, lastNameTextField, streetTextField, cityTextField, stateTextField, zipTextField, projectTextField]
        datePicker = DatePicker(forTextField: dateOfBirthTextField)
        dateOfBirthTextField.delegate = self
        projectTextField.delegate = self
        companyTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guestButton.setTitleColor(UIColor.white, for: .normal)
        employeeButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        managerButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        vendorButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton2.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton3.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton4.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton5.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        for textField in allTextFields {
            textField.isEnabled = false
        }
        for textField in childGuest {
            textField.isEnabled = true
        }
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
                self.dateOfBirth = newDate
            }
            
            datePicker?.pick(self, initDate: initDate, dataChanged: dateChangedCallback)
            return false
        } else if textField == projectTextField {
            chooseProjectNumber()
            return false
        } else if textField == companyTextField {
            chooseCompany()
            return false
        } else {
            return true
        }
    }
    
    @IBAction func GeneratePassPressed(_ sender: UIButton) {
        print("Creating pass for: \(entrantType)")
        var entrant: Entrant
        switch entrantType {
        case .Child:
            let age = dateOfBirth.age
            entrant = Visitor(type: .Child, age: age, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
            print(swipe(for: entrant))
            print(age)
        case .Classic:
            entrant = Visitor(type: .Classic, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, adress: nil, city: nil, state: nil, zip: nil)
            print(swipe(for: entrant))
        case .Contract:
            entrant = Employee(first: firstNameTextField.text!, last: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!, type: .Contract, projectNumber: projectTextField.text!)
            print(swipe(for: entrant))
        case .Food:
            entrant = Employee(first: firstNameTextField.text!, last: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!, type: .Food, projectNumber: nil)
            print(swipe(for: entrant))
        case .Maintenance:
            entrant = Employee(first: firstNameTextField.text!, last: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!, type: .Maintenance, projectNumber: nil)
            print(swipe(for: entrant))
        case .Manager:
            entrant = Manager(first: firstNameTextField.text!, last: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!)
            print(swipe(for: entrant))
        case .Ride:
            entrant = Employee(first: firstNameTextField.text!, last: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!, type: .Ride, projectNumber: nil)
            print(swipe(for: entrant))
        case .SeasonPass:
            entrant = Visitor(type: .SeasonPass, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!)
            print(swipe(for: entrant))
        case .Senior:
            let age = dateOfBirth.age
            entrant = Visitor(type: .Senior, age: age, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
            print(swipe(for: entrant))
            print(age)
        case .Vendor:
            entrant = Vendor(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, adress: streetTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zip: zipTextField.text!, company: companyTextField.text!)
            print(swipe(for: entrant))
        case .VIP:
            entrant = Visitor(type: .VIP, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, adress: nil, city: nil, state: nil, zip: nil)
            print(swipe(for: entrant))
        }
        performSegue(withIdentifier: "showPass", sender: swipe(for: entrant))
    }
    
    @IBAction func catButtonPressed(_ sender: UIButton) {
        guestButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        employeeButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        managerButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        vendorButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        sender.setTitleColor(UIColor.white, for: .normal)
        for textField in allTextFields {
            textField.isEnabled = false
            textField.text = nil
        }
        switch sender {
        case guestButton:
            stackButton1.setTitle("Child", for: .normal)
            stackButton2.setTitle("Adult", for: .normal)
            stackButton3.setTitle("Senior", for: .normal)
            stackButton4.setTitle("VIP", for: .normal)
            stackButton5.setTitle("Season Pass", for: .normal)
            stackButton5.isHidden = false
            for textField in childGuest {
                textField.isEnabled = true
            }
            entrantType = .Child
            stackButton2.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton3.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton4.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton5.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton1.setTitleColor(UIColor.white, for: .normal)
            category = "Guest"
        case employeeButton:
            stackButton1.setTitle("Food Services", for: .normal)
            stackButton2.setTitle("Ride Services", for: .normal)
            stackButton3.setTitle("Maintenance", for: .normal)
            stackButton4.setTitle("Contract Employee", for: .normal)
            stackButton5.isHidden = true
            for textField in employee {
                textField.isEnabled = true
            }
            entrantType = .Food
            stackButton2.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton3.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton4.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton5.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            stackButton1.setTitleColor(UIColor.white, for: .normal)
            category = "Employee"
        case managerButton:
            stackButton1.setTitle("", for: .normal)
            stackButton2.setTitle("", for: .normal)
            stackButton3.setTitle("", for: .normal)
            stackButton4.setTitle("", for: .normal)
            stackButton5.setTitle("", for: .normal)
            stackButton5.isHidden = false
            for textField in manager {
                textField.isEnabled = true
            }
            entrantType = .Manager
        case vendorButton:
            stackButton1.setTitle("", for: .normal)
            stackButton2.setTitle("", for: .normal)
            stackButton3.setTitle("", for: .normal)
            stackButton4.setTitle("", for: .normal)
            stackButton5.setTitle("", for: .normal)
            stackButton5.isHidden = false
            for textField in vendor {
                textField.isEnabled = true
            }
            entrantType = .Vendor
        default:
            print("Something went wrong! OOPS!")
        }
    }
    
    @IBAction func stackButtonPressed(_ sender: UIButton) {
        stackButton1.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton2.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton3.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton4.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        stackButton5.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        sender.setTitleColor(UIColor.white, for: .normal)
        for textfield in allTextFields {
            textfield.isEnabled = false
            textfield.text = nil
        }
        switch sender {
        case stackButton1:
            switch category {
            case "Guest":
                for textField in childGuest {
                    textField.isEnabled = true
                }
                entrantType = .Child
            case "Employee":
                for textField in employee {
                    textField.isEnabled = true
                }
                entrantType = .Food
            default:
                print("Something went wrong! OOPS!")
            }
        case stackButton2:
            switch category {
            case "Guest":
                for textField in classicGuest {
                    textField.isEnabled = true
                }
                entrantType = .Classic
            case "Employee":
                for textField in employee {
                    textField.isEnabled = true
                }
                entrantType = .Ride
            default:
                print("Something went wrong! OOPS!")
            }
        case stackButton3:
            switch category {
            case "Guest":
                for textField in seniorGuest {
                    textField.isEnabled = true
                }
                entrantType = .Senior
            case "Employee":
                for textField in employee {
                    textField.isEnabled = true
                }
                entrantType = .Maintenance
            default:
                print("Something went wrong! OOPS!")
            }
        case stackButton4:
            switch category {
            case "Guest":
                for textField in VIPGuest {
                    textField.isEnabled = true
                }
                entrantType = .VIP
            case "Employee":
                for textField in contractEmployee {
                    textField.isEnabled = true
                }
                entrantType = .Contract
            default:
                print("Something went wrong! OOPS!")
            }
        case stackButton5:
            switch category {
            case "Guest":
                for textField in seasonPassGuest {
                    textField.isEnabled = true
                }
                entrantType = .SeasonPass
            case "Employee":
                print("There's no employee button!")
            default:
                print("Something went wrong! OOPS!")
            }
        default:
            print("Something went wrong! OOPS!")
        }
    }
    
    func chooseProjectNumber() {
        let alertView = UIAlertController(title: "Choose project number", message: "Please choose a project number from the list below.", preferredStyle: .alert)
        for number in projectNumbers {
            let projectAction = UIAlertAction(title: "\(number)", style: .default, handler: { (action) in
                self.projectTextField.text = action.title
            })
            alertView.addAction(projectAction)
        }
        present(alertView, animated: true, completion: nil)
    }
    
    func chooseCompany() {
        let alertView = UIAlertController(title: "Choose company", message: "Please choose a company from the list below.", preferredStyle: .alert)
        for company in vendorCompanys {
            let companyAction = UIAlertAction(title: "\(company)", style: .default, handler: { (action) in
                self.companyTextField.text = action.title
            })
            alertView.addAction(companyAction)
        }
        present(alertView, animated: true, completion: nil)
    }
    
    func errorAppeared(title: String, description: String) {
        createAlert(withTitle: title, message: description)
    }
    
    func createAlert(withTitle title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        present(alertView, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPass" {
            let detailVC = segue.destination as! PassViewController
            detailVC.swipeDict = sender as! [String: Any]
            detailVC.name = "\(firstNameTextField.text!) \(lastNameTextField.text!)"
            switch self.entrantType {
            case .Child, .Classic, .VIP, .Senior, .SeasonPass:
                detailVC.type = "\(self.entrantType) Guest Pass"
            case .Food, .Maintenance, .Contract, .Ride:
                detailVC.type = "\(self.entrantType) Employee Pass"
            case .Manager, .Vendor:
                detailVC.type = "\(self.entrantType) Pass"
            }
            detailVC.delegate = self
        }
    }
    
    func createNewPassPressed() {
        catButtonPressed(guestButton)
    }
}

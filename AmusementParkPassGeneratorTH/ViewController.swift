//
//  ViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    @IBOutlet weak var enterDateButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        enterDateButton.addTarget(self, action: #selector(selectDateOfBirth), for: .touchUpInside)
    }
    
    @IBAction func GeneratePassPressed(_ sender: UIButton) {
        createAlert()
    }
    
    func selectDateOfBirth() {
       performSegue(withIdentifier: "ShowDatePicker", sender: nil)
    }
    
    func createAlert() {
        let alertView = UIAlertController(title: "TEST", message: "This is a message!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        present(alertView, animated: true, completion: nil)
    }
}

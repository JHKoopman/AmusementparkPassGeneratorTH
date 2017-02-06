//
//  DatePickerViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 06/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DateFormatter.dateFormat(fromTemplate: "MM/dd/yyyy", options: 0, locale: nil)
        
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
    }
    
    func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func done() {
        let dateString = dateFormatter.string(from: datePicker.date)
        ViewController.sharedInstance.dateOfBirt = dateString
        dismiss(animated: true) {
            ViewController.sharedInstance.setDateOfBirth()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

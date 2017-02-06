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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    func cancel() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

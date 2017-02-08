//
//  DateViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 07/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate : class {
    
    func datePickerVCDismissed(_ date: Date?)
}

class DateViewController: UIViewController {
    
    weak var delegate: DatePickerViewControllerDelegate?
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentDate: Date? {
        didSet {
            updatePickerCurrentDate()
        }
    }
    
    convenience init() {
        self.init(nibName: "PopDateViewController", bundle: nil)
    }
    
    private func updatePickerCurrentDate() {
        if let _currentDate = self.currentDate {
            if let _datePicker = self.datePicker {
                _datePicker.date = _currentDate
            }
        }
    }
    
    @IBAction func okAction(_ sender: AnyObject) {
        self.dismiss(animated: true) { 
            let date = self.datePicker.date
            self.delegate?.datePickerVCDismissed(date)
        }
    }
    
    override func viewDidLoad() {
        updatePickerCurrentDate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.delegate?.datePickerVCDismissed(nil)
    }
}

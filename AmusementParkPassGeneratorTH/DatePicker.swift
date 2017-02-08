//
//  DatePicker.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 07/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import UIKit

public class DatePicker: NSObject, UIPopoverPresentationControllerDelegate, DatePickerViewControllerDelegate {
    
    public typealias DatePickerCallback = (_ newDate : Date, _ forTextField : UITextField)->()

    var datePickerVC: DateViewController
    var popover: UIPopoverPresentationController?
    var textField: UITextField!
    var dataChanged: DatePickerCallback?
    var presented = false
    
    public init(forTextField: UITextField) {
        datePickerVC = DateViewController()
        self.textField = forTextField
        super.init()
    }
    
    func datePickerVCDismissed(_ date: Date?) {
        if let _dataChanged = dataChanged {
            if let _date = date {
                _dataChanged(_date, textField)
            }
        }
        presented = false
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

    public func pick(_ inViewController: UIViewController, initDate: Date?, dataChanged: @escaping DatePickerCallback) {
        if presented {
            return  //The popup is already there, so no need to show it again
        }
        datePickerVC.delegate = self
        datePickerVC.modalPresentationStyle = UIModalPresentationStyle.popover
        datePickerVC.preferredContentSize = CGSize(width: 500,height: 208)
        datePickerVC.currentDate = initDate
        
        popover = datePickerVC.popoverPresentationController
        
        if let _popover = popover {
            _popover.sourceView = textField
            _popover.sourceRect = CGRect(x: textField.bounds.size.width/2, y: textField.bounds.size.height/2, width: 0, height: 0)
            _popover.delegate = self
            self.dataChanged = dataChanged
            inViewController.present(datePickerVC, animated: true, completion: nil)
            presented = true
        }
    }
}

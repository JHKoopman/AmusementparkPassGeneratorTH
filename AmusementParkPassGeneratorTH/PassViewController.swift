//
//  PassViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 22/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
    
    //MARK: Outlets Variables and Constants
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ridesLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var amusementAreaView: UIView!
    @IBOutlet weak var kitchenAreaView: UIView!
    @IBOutlet weak var rideControlAreaView: UIView!
    @IBOutlet weak var maintenanceAreaView: UIView!
    @IBOutlet weak var officeAreaView: UIView!
    @IBOutlet weak var canSkipLinesView: UIView!
    @IBOutlet weak var amusementLabel: UILabel!
    @IBOutlet weak var kitchenLabel: UILabel!
    @IBOutlet weak var rideControl: UILabel!
    @IBOutlet weak var maintenanceLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var skipLinesLabel: UILabel!
    
    let greenColor = UIColor(red: 34/255, green: 161/255, blue: 55/255, alpha: 1)
    let redColor = UIColor(red: 161/255, green: 34/255, blue: 34/255, alpha: 1)
    
    var swipeDict: [String:Any]!
    var name: String!
    var type: String!
    var delegate: createNewPassDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        typeLabel.text = type
        if let _rides = swipeDict["ride"] as? Bool {
            if _rides {
                ridesLabel.text = "Unlimmited Rides"
            } else {
                ridesLabel.text = "No Rides"
            }
        }
        if let _foodDiscount = swipeDict["foodDiscount"] as? Percent {
            foodDiscountLabel.text = "\(_foodDiscount)% Food Discount"
        }
        if let _merchDiscount = swipeDict["merchDiscount"] as? Percent {
            merchDiscountLabel.text = "\(_merchDiscount)% Merch Discount"
        }
        if let _amusementAccess = swipeDict["Amusement"] as? Bool {
            if _amusementAccess {
                amusementAreaView.backgroundColor = greenColor
                amusementLabel.text = "ALLOWED"
            } else {
                amusementAreaView.backgroundColor = redColor
                amusementLabel.text = "DENIED"
            }
        }
        if let _kitchenAccess = swipeDict["Kitchen"] as? Bool {
            if _kitchenAccess {
                kitchenAreaView.backgroundColor = greenColor
                kitchenLabel.text = "ALLOWED"
            } else {
                kitchenAreaView.backgroundColor = redColor
                kitchenLabel.text = "DENIED"
            }
        }
        if let _rideControlAccess = swipeDict["RideControl"] as? Bool {
            if _rideControlAccess {
                rideControlAreaView.backgroundColor = greenColor
                rideControl.text = "ALLOWED"
            } else {
                rideControlAreaView.backgroundColor = redColor
                rideControl.text = "DENIED"
            }
        }
        if let _maintenanceAccess = swipeDict["Maintenance"] as? Bool {
            if _maintenanceAccess {
                maintenanceAreaView.backgroundColor = greenColor
                maintenanceLabel.text = "ALLOWED"
            } else {
                maintenanceAreaView.backgroundColor = redColor
                maintenanceLabel.text = "DENIED"
            }
        }
        if let _officeAccess = swipeDict["Office"] as? Bool {
            if _officeAccess {
                officeAreaView.backgroundColor = greenColor
                officeLabel.text = "ALLOWED"
            } else {
                officeAreaView.backgroundColor = redColor
                officeLabel.text = "DENIED"
            }
        }
        if let _skip = swipeDict["skip"] as? Bool {
            if _skip {
                canSkipLinesView.backgroundColor = greenColor
                skipLinesLabel.text = "ALLOWED"
            } else {
                canSkipLinesView.backgroundColor = redColor
                skipLinesLabel.text = "DENIED"
            }
        }
    }
    @IBAction func createNewPass(_ sender: UIButton) {
        resignFirstResponder()
        dismiss(animated: true) {
            self.delegate.createNewPassPressed()
        }
    }


}

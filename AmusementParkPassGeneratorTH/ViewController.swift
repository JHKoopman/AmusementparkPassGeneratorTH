//
//  ViewController.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var entrants: [Entrant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Plug values
        let visitor = Visitor(type: .Classic, identifier: "Visitor")
        let childVisitor = Visitor(age: 4, identifier: "ChildVisitor")
        let VIP = Visitor(type: .VIP, identifier: "VIP")
        let manager = Manager(first: "Jack", last: "Black", adress: "Somestreet 12", city: "New-York City", state: "New York", zip: "10024")
        let maintenanceEmployee = Employee(first: "David", last: "Bentham", adress: "Somestreet 17", city: "New-York City", state: "New York", zip: "10024", type: .Maintenance)
        let foodEmployee = Employee(first: "Christopher", last: "Columbus", adress: "Anotherstreet 104", city: "New-York City", state: "New York", zip: "10025", type: .Food)
        let rideEmployee = Employee(first: "John", last: "Cena", adress: "Athirdstreet 902", city: "New-York City", state: "New York", zip: "10020", type: .Ride)
        
        entrants = [visitor, childVisitor, VIP, manager, foodEmployee, rideEmployee, maintenanceEmployee]
        
        //MARK: SwipeCalls
        //Grouped swipes:
//        groupedSwipe(type: Area.Amusement.rawValue)
//        groupedSwipe(type: Area.Kitchen.rawValue)
//        groupedSwipe(type: Area.Maintenance.rawValue)
//        groupedSwipe(type: Area.Office.rawValue)
//        groupedSwipe(type: Area.RideControl.rawValue)
//        groupedSwipe(type: "foodDiscount")
//        groupedSwipe(type: "merchDiscount")
//        groupedSwipe(type: "ride")
//        groupedSwipe(type: "skip")
        
        //Individual swipes:
//        swipeForType(entrant: visitor, type: Area.Amusement.rawValue)
//        swipeForType(entrant: visitor, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: visitor, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: visitor, type: Area.Office.rawValue)
//        swipeForType(entrant: visitor, type: Area.RideControl.rawValue)
//        swipeForType(entrant: visitor, type: "foodDiscount")
//        swipeForType(entrant: visitor, type: "merchDiscount")
//        swipeForType(entrant: visitor, type: "ride")
//        swipeForType(entrant: visitor, type: "skip")
//        swipeForType(entrant: childVisitor, type: Area.Amusement.rawValue)
//        swipeForType(entrant: childVisitor, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: childVisitor, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: childVisitor, type: Area.Office.rawValue)
//        swipeForType(entrant: childVisitor, type: Area.RideControl.rawValue)
//        swipeForType(entrant: childVisitor, type: "foodDiscount")
//        swipeForType(entrant: childVisitor, type: "merchDiscount")
//        swipeForType(entrant: childVisitor, type: "ride")
//        swipeForType(entrant: childVisitor, type: "skip")
//        swipeForType(entrant: VIP, type: Area.Amusement.rawValue)
//        swipeForType(entrant: VIP, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: VIP, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: VIP, type: Area.Office.rawValue)
//        swipeForType(entrant: VIP, type: Area.RideControl.rawValue)
//        swipeForType(entrant: VIP, type: "foodDiscount")
//        swipeForType(entrant: VIP, type: "merchDiscount")
//        swipeForType(entrant: VIP, type: "ride")
//        swipeForType(entrant: VIP, type: "skip")
//        swipeForType(entrant: manager, type: Area.Amusement.rawValue)
//        swipeForType(entrant: manager, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: manager, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: manager, type: Area.Office.rawValue)
//        swipeForType(entrant: manager, type: Area.RideControl.rawValue)
//        swipeForType(entrant: manager, type: "foodDiscount")
//        swipeForType(entrant: manager, type: "merchDiscount")
//        swipeForType(entrant: manager, type: "ride")
//        swipeForType(entrant: manager, type: "skip")
//        swipeForType(entrant: maintenanceEmployee, type: Area.Amusement.rawValue)
//        swipeForType(entrant: maintenanceEmployee, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: maintenanceEmployee, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: maintenanceEmployee, type: Area.Office.rawValue)
//        swipeForType(entrant: maintenanceEmployee, type: Area.RideControl.rawValue)
//        swipeForType(entrant: maintenanceEmployee, type: "foodDiscount")
//        swipeForType(entrant: maintenanceEmployee, type: "merchDiscount")
//        swipeForType(entrant: maintenanceEmployee, type: "ride")
//        swipeForType(entrant: maintenanceEmployee, type: "skip")
//        swipeForType(entrant: foodEmployee, type: Area.Amusement.rawValue)
//        swipeForType(entrant: foodEmployee, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: foodEmployee, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: foodEmployee, type: Area.Office.rawValue)
//        swipeForType(entrant: foodEmployee, type: Area.RideControl.rawValue)
//        swipeForType(entrant: foodEmployee, type: "foodDiscount")
//        swipeForType(entrant: foodEmployee, type: "merchDiscount")
//        swipeForType(entrant: foodEmployee, type: "ride")
//        swipeForType(entrant: foodEmployee, type: "skip")
//        swipeForType(entrant: rideEmployee, type: Area.Amusement.rawValue)
//        swipeForType(entrant: rideEmployee, type: Area.Kitchen.rawValue)
//        swipeForType(entrant: rideEmployee, type: Area.Maintenance.rawValue)
//        swipeForType(entrant: rideEmployee, type: Area.Office.rawValue)
//        swipeForType(entrant: rideEmployee, type: Area.RideControl.rawValue)
//        swipeForType(entrant: rideEmployee, type: "foodDiscount")
//        swipeForType(entrant: rideEmployee, type: "merchDiscount")
//        swipeForType(entrant: rideEmployee, type: "ride")
//        swipeForType(entrant: rideEmployee, type: "skip")
        
        //Complete swipes:
//        swipeV2(for: visitor)
//        swipeV2(for: childVisitor)
//        swipeV2(for: VIP)
//        swipeV2(for: manager)
//        swipeV2(for: maintenanceEmployee)
//        swipeV2(for: foodEmployee)
//        swipeV2(for: rideEmployee)
    }

    func groupedSwipe(type: String) {
        for entrant in entrants {
            if let boolSwipeReturn = swipeV2(for: entrant)[type] as? Bool {
                print("\(type) gives: \(boolSwipeReturn) for \(entrant.identifier)")
            } else if let percentSwipeReturn = swipeV2(for: entrant)[type] as? Percent {
                print("\(type) gives: \(percentSwipeReturn) for \(entrant.identifier)")
            }
        }
    }
    func swipeForType(entrant: Entrant, type: String) {
        if let boolSwipeReturn = swipeV2(for: entrant)[type] as? Bool {
            print("\(type) gives: \(boolSwipeReturn) for \(entrant.identifier)")
        } else if let percentSwipeReturn = swipeV2(for: entrant)[type] as? Percent {
            print("\(type) gives: \(percentSwipeReturn) for \(entrant.identifier)")
        }
    }
    
}


//
//  DataModel.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

import UIKit

//MARK: Typealiases

typealias Percent = Int
typealias Age = Int

//MARK: Enums 
enum Area: String {
    case Amusement = "Amusement", Kitchen = "Kitchen", RideControl = "RideControl", Maintenance = "Maintenance", Office = "Office"
    
    static let AllValues = [Amusement, Kitchen, RideControl, Maintenance, Office]
}

enum ErrorType: Error {
    case MissingFirstName, MissingLastName, MissingAdress, MissingState, MissingCity, MissingZIP
}

enum EmployeeType {
    case Food, Ride, Maintenance
}

enum GuestType {
    case Classic, Child, VIP
}

//MARK: Protocols

protocol Entrant {
    var areaAccess: [Area] { get }
    var identifier: String { get } /*Identifier is just something to make things more clear while we have no UI. Will be deleted once there is UI*/
}

protocol Guest: Entrant {
    var type: GuestType { get }
}

protocol Administrator: Entrant, Discount {
    var firstName: String { get }
    var lastName: String { get }
    var adress: String { get }
    var city: String { get }
    var state: String { get }
    var zip: String { get }
}

protocol Worker: Entrant, Discount { /*Used worker as protocol name here because I wanted Employee as Class name*/
    var firstName: String { get }
    var lastName: String { get }
    var adress: String { get }
    var city: String { get }
    var state: String { get }
    var zip: String { get }
}

protocol Discount {
    var foodDiscount: Percent { get }
    var merchDiscount: Percent { get }
}

//MARK: Extensions
//Adding default values
extension Worker {
    var foodDiscount: Percent {
        return 15
    }
    var merchDiscount: Percent {
        return 25
    }
}

extension Manager {
    var foodDiscount: Percent {
        return 25
    }
    var merchDiscount: Percent {
        return 25
    }
    
    var areaAccess: [Area] {
        return [Area.Amusement, Area.Kitchen, Area.Maintenance, Area.Office, Area.RideControl]
    }
}

extension Guest {
    var areaAccess: [Area] {
        return [Area.Amusement]
    }
}

//MARK: Swipe method

func swipe(for entrant: Entrant) -> [String: Any] {
    
    var swipeDict: [String: Any] = [:]
    //First figure out what kind of Entrant we have
    if let employee = entrant as? Employee {
        //Than make a dictionary with all possible swipes and return that
        for x in Area.AllValues {
            if employee.areaAccess.contains(x) {swipeDict.updateValue(true, forKey: x.rawValue)} else {swipeDict.updateValue(false, forKey: x.rawValue)}
        }
        swipeDict.updateValue(employee.foodDiscount, forKey: "foodDiscount")
        swipeDict.updateValue(employee.merchDiscount, forKey: "merchDiscount")
        swipeDict.updateValue(true, forKey: "ride")
        swipeDict.updateValue(false, forKey: "skip")
        return swipeDict
    } else if let visitor = entrant as? Visitor {
        for x in Area.AllValues {
            if visitor.areaAccess.contains(x) {swipeDict.updateValue(true, forKey: x.rawValue)} else {swipeDict.updateValue(false, forKey: x.rawValue)}
        }
        swipeDict.updateValue(visitor.foodDiscount, forKey: "foodDiscount")
        swipeDict.updateValue(visitor.merchDiscount, forKey: "merchDiscount")
        swipeDict.updateValue(true, forKey: "ride")
        if visitor.type == .VIP {swipeDict.updateValue(true, forKey: "skip")} else {swipeDict.updateValue(false, forKey: "skip")}
        return swipeDict
    } else if let manager = entrant as? Manager {
        for x in Area.AllValues {
            if manager.areaAccess.contains(x) {swipeDict.updateValue(true, forKey: x.rawValue)} else {swipeDict.updateValue(false, forKey: x.rawValue)}
        }
        swipeDict.updateValue(manager.foodDiscount, forKey: "foodDiscount")
        swipeDict.updateValue(manager.merchDiscount, forKey: "merchDiscount")
        swipeDict.updateValue(true, forKey: "ride")
        swipeDict.updateValue(false, forKey: "skip")
        return swipeDict
    } else {
        return swipeDict
    }
}











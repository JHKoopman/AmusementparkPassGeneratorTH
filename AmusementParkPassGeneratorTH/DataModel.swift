//
//  DataModel.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 10/12/2016.
//  Copyright © 2016 JarICT. All rights reserved.
//

//MARK: Typealiases

typealias Percent = Int
typealias Age = Int

//MARK: Enums 
enum Area: String {
    case Amusement = "Amusement", Kitchen = "Kitchen", RideControl = "RideControl", Maintenance = "Maintenance", Office = "Office"
    
    static let AllValues = [Amusement, Kitchen, RideControl, Maintenance, Office]
}

enum SwipeType {
    case AmusementArea, ControlArea, KitchenArea, Office, MaintenanceArea, Ride, Skip, FoodDiscount, MerchDiscount
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
    var identifier: String { get }
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

protocol Worker: Entrant, Discount {
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


//MARK: Classes

class Employee: Worker {
    var firstName: String
    var lastName: String
    var adress: String
    var city: String
    var state: String
    var zip: String
    var areaAccess: [Area]
    var identifier: String
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String, type: EmployeeType) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        self.identifier = first
        
        switch type {
        case .Food:
            self.areaAccess = [Area.Amusement, Area.Kitchen]
        case .Maintenance:
            self.areaAccess = [Area.Amusement, Area.Maintenance, Area.RideControl]
        case .Ride:
            self.areaAccess = [Area.Amusement, Area.RideControl]
        }
    }
}

class Visitor: Guest, Discount {
    var foodDiscount: Percent{
        switch self.type {
        case .Classic, .Child: return 0
        case .VIP: return 10
        }
    }
    var merchDiscount: Percent {
        switch self.type {
        case .Child, .Classic: return 0
        case .VIP: return 20
        }
    }
    var type: GuestType
    var age: Age?
    var identifier: String
    
    init(type: GuestType, identifier: String) {
        self.type = type
        self.identifier = identifier
    }
    init(age: Age, identifier: String) {
        if age <= 5 {
            self.type = .Child
        } else {
            self.type = .Classic
        }
        self.age = age
        self.identifier = identifier
    }
    
}

class Manager: Administrator {
    var firstName: String
    var lastName: String
    var adress: String
    var city: String
    var state: String
    var zip: String
    var identifier: String
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        self.identifier = firstName
    }
}

//MARK: Swipe method

func swipeV2(for entrant: Entrant) -> [String: Any] {
    
    var swipeDict: [String: Any] = [:]
    
    if let employee = entrant as? Employee {
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

func swipe(for entrant: Entrant, swipeType: SwipeType) -> String {
    
    if let employee = entrant as? Employee {
        print("Employee passed in! First name: \(employee.firstName)")
        switch swipeType {
        case .AmusementArea: if employee.areaAccess.contains(.Amusement) {return "true"} else {return "false"}
        case .ControlArea: if employee.areaAccess.contains(.RideControl) {return "true"} else {return "false"}
        case .KitchenArea: if employee.areaAccess.contains(.Kitchen) {return "true"} else {return "false"}
        case .MaintenanceArea: if employee.areaAccess.contains(.Maintenance) {return "true"} else {return "false"}
        case .Office: if employee.areaAccess.contains(.Office) {return "true"} else {return "false"}
        case .FoodDiscount: return "\(employee.foodDiscount)"
        case .MerchDiscount: return "\(employee.merchDiscount)"
        case .Ride: return "true"
        case .Skip: return "false"
        }
    } else if let visitor = entrant as? Visitor {
        print("Visitor passed in! Type: \(visitor.type)")
        switch swipeType {
        case .AmusementArea: if visitor.areaAccess.contains(.Amusement) {return "true"} else {return "false"}
        case .ControlArea: if visitor.areaAccess.contains(.RideControl) {return "true"} else {return "false"}
        case .KitchenArea: if visitor.areaAccess.contains(.Kitchen) {return "true"} else {return "false"}
        case .MaintenanceArea: if visitor.areaAccess.contains(.Maintenance) {return "true"} else {return "false"}
        case .Office: if visitor.areaAccess.contains(.Office) {return "true"} else {return "false"}
        case .FoodDiscount: return "\(visitor.foodDiscount)"
        case .MerchDiscount: return "\(visitor.merchDiscount)"
        case .Ride: return "true"
        case .Skip: if visitor.type == .VIP {return "true"} else {return "false"}
        }
    } else if let manager = entrant as? Manager {
        print("Manager passed in! First name: \(manager.firstName)")
        switch swipeType {
        case .AmusementArea: if manager.areaAccess.contains(.Amusement) {return "true"} else {return "false"}
        case .ControlArea: if manager.areaAccess.contains(.RideControl) {return "true"} else {return "false"}
        case .KitchenArea: if manager.areaAccess.contains(.Kitchen) {return "true"} else {return "false"}
        case .MaintenanceArea: if manager.areaAccess.contains(.Maintenance) {return "true"} else {return "false"}
        case .Office: if manager.areaAccess.contains(.Office) {return "true"} else {return "false"}
        case .FoodDiscount: return "\(manager.foodDiscount)"
        case .MerchDiscount: return "\(manager.merchDiscount)"
        case .Ride: return "true"
        case .Skip: return "false"
        }
    } else {
        return "false"
    }
}










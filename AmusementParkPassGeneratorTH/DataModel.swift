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
enum Area {
    case Amusement, Kitchen, RideControl, Maintenance, Office
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
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String, type: EmployeeType) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        
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
    var foodDiscount: Percent
    var merchDiscount: Percent
    var type: GuestType
    var age: Age?
    
    
    
    init(type: GuestType) {
        self.type = type
        
        switch type {
        case .Classic, .Child:
            self.foodDiscount = 0
            self.merchDiscount = 0
        case .VIP:
            self.foodDiscount = 10
            self.merchDiscount = 20
        }
        
    }
    init(type: GuestType, age: Age) {
        self.type = type
        self.age = age
        
        switch type {
        case .Classic, .Child:
            self.foodDiscount = 0
            self.merchDiscount = 0
        case .VIP:
            self.foodDiscount = 10
            self.merchDiscount = 20
        }
    }
    
}

class Manager: Administrator {
    var firstName: String
    var lastName: String
    var adress: String
    var city: String
    var state: String
    var zip: String
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
    }
    
    
}













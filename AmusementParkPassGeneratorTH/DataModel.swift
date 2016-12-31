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

enum ManagerType {
    case Normal
}

enum EmployeeType {
    case Food, Ride, Maintenance
}

enum GuestType {
    case Classic, Child(Age), VIP
}

//MARK: Protocols

protocol Entrant {
    var areaAccess: [Area] { get }
}

protocol Guest: Entrant {
    var type: GuestType { get }
}

protocol Employee: Entrant, Discount {
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

protocol VIPDiscount: Discount {}
protocol ManagerDiscount: Discount{}
protocol EmployeeDiscount: Discount {}

//MARK: Extensions

extension VIPDiscount {
    var foodDiscount: Percent {
        return 10
    }
    var merchDiscount: Percent {
        return 20
    }
}

extension Employee {
    var foodDiscount: Percent {
        return 15
    }
    var merchDiscount: Percent {
        return 25
    }
}

extension ManagerDiscount {
    var foodDiscount: Percent {
        return 25
    }
    var merchDiscount: Percent {
        return 25
    }
}

extension Guest {
    var areaAccess: [Area] {
        return [Area.Amusement]
    }
}










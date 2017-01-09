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


//MARK: Classes

class Employee: Worker {
    let firstName: String
    let lastName: String
    let adress: String
    let city: String
    let state: String
    let zip: String
    let areaAccess: [Area]
    let identifier: String
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String, type: EmployeeType) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        self.identifier = "Employee \(first)"
        
        switch type { /*Adding area access based on the EmployeeType*/
        case .Food:
            self.areaAccess = [Area.Amusement, Area.Kitchen]
        case .Maintenance:
            self.areaAccess = [Area.Amusement, Area.Maintenance, Area.RideControl]
        case .Ride:
            self.areaAccess = [Area.Amusement, Area.RideControl]
        }
        
        do {
            try validateData(first: first, last: last, adress: adress, city: city, state: state, zip: zip)
        } catch ErrorType.MissingFirstName {
            print("First name is missing! Please fill in a first name and try again!")
        } catch ErrorType.MissingLastName {
            print("Last name is missing! Please fill in a last name and try again!")
        } catch ErrorType.MissingAdress {
            print("Adress is missing! Please fill in an adress and try again!")
        } catch ErrorType.MissingCity {
            print("City is missing! Please fill in a city and try again!")
        } catch ErrorType.MissingState {
            print("State is missing! Please fill in a state and try again!")
        } catch ErrorType.MissingZIP {
            print("ZIP is missing! Please fill in a ZIP and try again!")
        } catch {
            fatalError("Something went wrong!")
        }
    }
    
    func validateData(first: String, last: String, adress: String, city: String, state: String, zip: String) throws {
        guard first != "" else {
            throw ErrorType.MissingFirstName
        }
        guard last != "" else {
            throw ErrorType.MissingLastName
        }
        guard adress != "" else {
            throw ErrorType.MissingAdress
        }
        guard city != "" else {
            throw ErrorType.MissingCity
        }
        guard state != "" else {
            throw ErrorType.MissingState
        }
        guard zip != "" else {
            throw ErrorType.MissingZIP
        }
    }

}

class Visitor: Guest, Discount {
    var foodDiscount: Percent{ /*Calculate discount based on GuestType*/
        switch self.type {
        case .Classic, .Child: return 0
        case .VIP: return 10
        }
    }
    var merchDiscount: Percent { /*Calculate discount based on GuestType*/
        switch self.type {
        case .Child, .Classic: return 0
        case .VIP: return 20
        }
    }
    let type: GuestType
    let age: Age?
    let identifier: String
    
    init(type: GuestType, identifier: String) { /*Init for classic or VIP guests, no extra information needed*/
        self.type = type
        self.identifier = identifier
        self.age = nil
    }
    init(age: Age, identifier: String) { /*Init for Child guests, if a age above 5 is passed in the pass will be converted into a Classic pass*/
        if age <= 5 {
            self.type = .Child
        } else {
            self.type = .Classic
            print("The age too high to get a Child pass! The pass is converted into a Classic pass!")
        }
        self.age = age
        self.identifier = identifier
    }
    
}


class Manager: Administrator {
    let firstName: String
    let lastName: String
    let adress: String
    let city: String
    let state: String
    let zip: String
    let identifier: String
    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        self.identifier = "Manager \(first)"
        
        do {
            try validateData(first: first, last: last, adress: adress, city: city, state: state, zip: zip)
        } catch ErrorType.MissingFirstName {
            print("First name is missing! Please fill in a first name and try again!")
        } catch ErrorType.MissingLastName {
            print("Last name is missing! Please fill in a last name and try again!")
        } catch ErrorType.MissingAdress {
            print("Adress is missing! Please fill in an adress and try again!")
        } catch ErrorType.MissingCity {
            print("City is missing! Please fill in a city and try again!")
        } catch ErrorType.MissingState {
            print("State is missing! Please fill in a state and try again!")
        } catch ErrorType.MissingZIP {
            print("ZIP is missing! Please fill in a ZIP and try again!")
        } catch {
            fatalError("Something went wrong!")
        }
    }
    
    func validateData(first: String, last: String, adress: String, city: String, state: String, zip: String) throws {
        guard first != "" else {
            throw ErrorType.MissingFirstName
        }
        guard last != "" else {
            throw ErrorType.MissingLastName
        }
        guard adress != "" else {
            throw ErrorType.MissingAdress
        }
        guard city != "" else {
            throw ErrorType.MissingCity
        }
        guard state != "" else {
            throw ErrorType.MissingState
        }
        guard zip != "" else {
            throw ErrorType.MissingZIP
        }
    }
}

//MARK: Swipe method

func swipe(for entrant: Entrant) -> [String: Any] {
    
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











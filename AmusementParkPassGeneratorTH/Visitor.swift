//
//  Visitor.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 18/01/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import Foundation
class Visitor: Guest, Discount {
    var foodDiscount: Percent{ /*Calculate discount based on GuestType*/
        switch self.type {
        case .Classic, .Child: return 0
        case .VIP, .SeasonPass, .Senior: return 10
        }
    }
    var merchDiscount: Percent { /*Calculate discount based on GuestType*/
        switch self.type {
        case .Child, .Classic: return 0
        case .Senior: return 10
        case .VIP, .SeasonPass: return 20
        }
    }
    let type: GuestType
    let age: Age?
    let firstName: String
    let lastName: String
    let adress: String?
    let city: String?
    let state: String?
    let zip: String?
    let delegate: errorHandler = ViewController()


    init(type: GuestType, firstName: String, lastName: String, adress: String?, city: String?, state: String?, zip: String?) { /*Init for classic or VIP guests, no extra information needed*/
        self.type = type
        self.age = nil
        self.firstName = firstName
        self.lastName = lastName
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
    }
    
    init(type: GuestType, age: Age, firstName: String, lastName: String) { /*Init for Child guests, if a age above 5 is passed in the pass will be converted into a Classic pass*/
        switch type {
        case .Child:
            if age < 5 {
                self.type = .Child
            } else {
                print("Person is too old to get a child pass, converting to a Classic pass")
                self.type = .Classic
            }
        case .Senior:
            if age > 65 {
                self.type = .Senior
            } else {
                print("Person is too young to get a senior pass, converting to a Classic pass")
                self.type = .Classic
            }
        default:
            self.type = .Classic
        }
        self.age = age
        self.firstName = firstName
        self.lastName = lastName
        self.adress = nil
        self.city = nil
        self.state = nil
        self.zip = nil
    }
}

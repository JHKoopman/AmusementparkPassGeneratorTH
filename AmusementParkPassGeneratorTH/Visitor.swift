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

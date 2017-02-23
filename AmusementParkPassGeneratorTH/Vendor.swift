//
//  Vendor.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 21/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import Foundation

class Vendor: Merchant {
    var adress: String
    var areaAccess: [Area]
    var city: String
    var firstName: String
    var lastName: String
    var state: String
    var zip: String

    
    init(firstName: String, lastName: String, adress: String, city: String, state: String, zip: String, company: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        switch company {
        case "Acme":
            self.areaAccess = [Area.Kitchen]
        case "Orkin":
            self.areaAccess = [Area.Amusement, Area.RideControl, Area.Kitchen]
        case "Fedex":
            self.areaAccess = [Area.Maintenance, Area.Office]
        case "NW Electrical":
            self.areaAccess = [Area.Amusement, Area.RideControl, Area.Kitchen, Area.Maintenance, Area.Office]
        default:
            self.areaAccess = []
        }
    }
    
}

//
//  Manager.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 18/01/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import Foundation

class Manager: Administrator {
    let firstName: String
    let lastName: String
    let adress: String
    let city: String
    let state: String
    let zip: String
    let identifier: String
    let delegate: errorHandler = ViewController()

    
    init(first: String, last: String, adress: String, city: String, state: String, zip: String) {
        self.firstName = first
        self.lastName = last
        self.adress = adress
        self.city = city
        self.state = state
        self.zip = zip
        self.identifier = "Manager \(first)"
        
        do { /*Checking if all data is entered, otherwise throwing an Error*/
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

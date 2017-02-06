//
//  TextField.swift
//  AmusementParkPassGeneratorTH
//
//  Created by Jari Koopman on 06/02/2017.
//  Copyright © 2017 JarICT. All rights reserved.
//

import UIKit

class TextField: UITextField {
    let inset: CGFloat = 10
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset , dy: inset)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset , dy: inset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }
}

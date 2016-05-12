//
//  customUITextField.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 5/7/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit

class customUITextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 15.0
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSizeMake(0.0, 5.0)
        
    }

}

//
//  customImage.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 5/24/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import Foundation
import UIKit

class customImage: UIImageView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 15.0
        //layer.shadowColor = (UIColor.blackColor() as! CGColor)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSizeMake(0.0, 5.0)
    }
    
}

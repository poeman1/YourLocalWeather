//
//  ViewController.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 4/19/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weather = Weather(location: 64804)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        weather.downloadWeather { () -> () in
            
        
            
        }
    
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


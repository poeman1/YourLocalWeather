//
//  ViewController.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 4/19/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var weather = Weather(location: 95015)
    var forecast = Forcast()
    
    
    @IBOutlet weak var mainWeatherIcon: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempGuageImage: UIImageView!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var locationInputText: UITextField!

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationInputText.delegate = self
        weather.downloadWeather { () -> () in
            
            self.mainWeatherIcon.image = UIImage(named: "\(self.weather.weatherIconID)")
            self.locationNameLabel.text = self.weather.locationName
            self.currentTempLabel.text = "\(self.weather.currentTemp)\u{00B0}"
            self.longDescriptionLabel.text = self.weather.currentWeatherLongDescription
            self.sunriseLabel.text = self.weather.sunrise
            self.sunsetLabel.text = self.weather.sunset
            self.currentTimeLabel.text = self.weather.time
            self.dayLabel.text = self.weather.day
            self.dateLabel.text = self.weather.date
            self.shortDescriptionLabel.text = self.weather.currentWeatherShortDescription
            if Int(self.weather.currentTemp) <= 55 {
                self.tempGuageImage.image = UIImage(named: "lowTemp")
            } else if Int(self.weather.currentTemp) <= 75 {
                self.tempGuageImage.image = UIImage(named: "normTemp")
            } else {
                self.tempGuageImage.image = UIImage(named: "highTemp")
            }
            self.forecast.downloadForecast { () -> () in
                
            }

            
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let loc = Int(locationInputText.text!) {
            weather = Weather(location: loc)
            self.viewDidLoad()
        } else if let loc = locationInputText.text?.stringByReplacingOccurrencesOfString(" ", withString: "") {
            weather = Weather(location: loc)
            self.viewDidLoad()
        }
        
        self.view.endEditing(true)
        return true
    }
    
    
    
    


}


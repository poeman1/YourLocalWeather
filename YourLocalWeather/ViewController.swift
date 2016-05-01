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
    //var forecast = Forcast()
    
    
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
    @IBOutlet weak var forecastDayOneIcon: UIImageView!
    @IBOutlet weak var forecastDayOneTempLabel: UILabel!
    @IBOutlet weak var forecastDayOneDescLabel: UILabel!
    @IBOutlet weak var forecastDayTwoIcon: UIImageView!
    @IBOutlet weak var forecastDayTwoTempLabel: UILabel!
    @IBOutlet weak var forecastDayTwoDescLabel: UILabel!
    @IBOutlet weak var forecastDayThreeIcon: UIImageView!
    @IBOutlet weak var forecastDayThreeTempLabel: UILabel!
    @IBOutlet weak var forecastDayThreeDescLabel: UILabel!
    
    @IBOutlet weak var forecastDayFourIcon: UIImageView!
    @IBOutlet weak var forecastDayFourTempLabel: UILabel!
    @IBOutlet weak var forecastDayFourDescLabel: UILabel!
    
    @IBOutlet weak var forecastDayFiveIcon: UIImageView!
    @IBOutlet weak var forecastDayFiveTempLabel: UILabel!
    @IBOutlet weak var forecastDayFiveDescLabel: UILabel!

    
    
    

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
            print("view loading")
            self.forecastDayOneIcon.image = UIImage(named: "\(self.weather.day1Icon)")
            self.forecastDayOneTempLabel.text = self.weather.day1Temp
            self.forecastDayOneDescLabel.text = self.weather.day1Description
            self.forecastDayTwoIcon.image = UIImage(named: "\(self.weather.day2Icon)")
            self.forecastDayTwoTempLabel.text = self.weather.day2Temp
            self.forecastDayTwoDescLabel.text = self.weather.day2Description
            self.forecastDayThreeIcon.image = UIImage(named: "\(self.weather.day3Icon)")
            self.forecastDayThreeTempLabel.text = self.weather.day3Temp
            self.forecastDayThreeDescLabel.text = self.weather.day3Description
            self.forecastDayFourIcon.image = UIImage(named: "\(self.weather.day4Icon)")
            self.forecastDayFourTempLabel.text = self.weather.day4Temp
            self.forecastDayFourDescLabel.text = self.weather.day4Description
            self.forecastDayFiveIcon.image = UIImage(named: "\(self.weather.day5Icon)")
            self.forecastDayFiveTempLabel.text = self.weather.day5Temp
            self.forecastDayFiveDescLabel.text = self.weather.day5Description

            
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


//
//  ViewController.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 4/19/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var weather: Weather = Weather(location: 95015)
    
    
    
    @IBOutlet weak var upperBG: UIImageView!
    @IBOutlet weak var lowerBG: UIImageView!
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
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
            
            self.forecastDayOneTempLabel.text = self.weather.day1Temp
            self.forecastDayOneDescLabel.text = self.weather.day1Description
            
            self.forecastDayTwoTempLabel.text = self.weather.day2Temp
            self.forecastDayTwoDescLabel.text = self.weather.day2Description
            
            self.forecastDayThreeTempLabel.text = self.weather.day3Temp
            self.forecastDayThreeDescLabel.text = self.weather.day3Description
            
            self.forecastDayFourTempLabel.text = self.weather.day4Temp
            self.forecastDayFourDescLabel.text = self.weather.day4Description
            
            self.forecastDayFiveTempLabel.text = self.weather.day5Temp
            self.forecastDayFiveDescLabel.text = self.weather.day5Description
            
            self.getForecast { () -> () in
                self.forecastDayOneIcon.image = self.weather.day1IconImage
                self.forecastDayTwoIcon.image = self.weather.day2IconImage
                self.forecastDayThreeIcon.image = self.weather.day3IconImage
                self.forecastDayFourIcon.image = self.weather.day4IconImage
                self.forecastDayFiveIcon.image = self.weather.day5IconImage
            }
            self.selectBG()
            
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
        locationInputText.text = nil
        return true
    }
    
        
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            
        let userLocation: CLLocation = locations[0]
            
            
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = CLPlacemark(placemark: placemarks![0] )
                    if pm.postalCode != nil {
                        self.weather = Weather(location: pm.postalCode!)
                    }
                    
                    
                } else {
                    print("Problem with the data received from geocoder")
                }
            }
            self.locationManager.stopUpdatingLocation()
            
            
    }
    
    override func viewWillAppear(animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    func selectBG() {
        let icon = weather.weatherIconID
        upperBG.image = UIImage(named: "\(icon)BG")
        //lowerBG.image = UIImage(named: "\(icon)BG")
        
    }
    func getForecast(completed: DownloadComplete) {
        
        weather.getForcastIcon(self.weather.day1Icon, day: "one")
        weather.getForcastIcon(self.weather.day2Icon, day: "two")
        weather.getForcastIcon(self.weather.day3Icon, day: "three")
        weather.getForcastIcon(self.weather.day4Icon, day: "four")
        weather.getForcastIcon(self.weather.day5Icon, day: "five")
        
        completed()
        viewDidLoad()
    }
    
    
    
}


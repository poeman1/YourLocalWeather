//
//  weather.swift
//  YourLocalWeather
//
//  Created by Joel Poe on 4/21/16.
//  Copyright © 2016 Joel Poe. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _currentWeatherMain: String!
    private var _currentWeatherLongDescription: String!
    private var _currentWeatherShortDescription: String!
    private var _currentWeatherCodeDescription: Int!
    private var _weatherID: Int!
    private var _weatherIconID: String!
    private var _weatherIconImage: UIImage!
    private var _dlWeatherIconImage: UIImage!
    private var _day: String!
    private var _date: String!
    private var _time: String!
    private var _sunrise: String!
    private var _sunset: String!
    private var _currentTemp: Int!
    private var _humidity: Int!
    private var _lowTemp: Int!
    private var _highTemp: Int!
    private var _locationName: String!
    private var _URL_COMPLETE: String!
    private var _URL_BASE: String! = "http://api.openweathermap.org/data/2.5/weather?"
    private var _URL_LOC: String! = "zip=64801,us"
    private var _URL_APPID: String! = "&APPID=c388210d4502949751d13328f1b7ae3d"
    
    
    init(location: AnyObject) {
        
        if let obj = location as? String {
            self._URL_LOC = "q=\(obj)"
        } else if let obj = location as? Int {
            self._URL_LOC = "zip=\(obj),us"
        }
        
        //self._URL_LOC = location as! String
    }
    
    
    func downloadWeather(completed: DownloadComplete) {
    
        let url = "\(self._URL_BASE)\(self._URL_LOC)\(_URL_APPID)"
        //let url = "http://api.openweathermap.org/data/2.5/weather?zip=64801,us&APPID=c388210d4502949751d13328f1b7ae3d"
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let description = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    
                    if let longDesc = description[0]["description"] {
                        self._currentWeatherLongDescription = longDesc.capitalizedString
                    }
                    if let shortDesc = description[0]["main"] {
                        self._currentWeatherShortDescription = shortDesc as! String
                    }
                    if let iconID = description[0]["icon"] {
                        self._weatherIconID = iconID as! String
                    }
                    if let id = description[0]["id"] {
                        self._weatherID = id as! Int
                    }
//                    print(self._currentWeatherLongDescription)
//                    print(self._currentWeatherShortDescription)
//                    print(self._weatherIconID)
//                    print(self._weatherID)
                }
                
                if let name = dict["name"] {
                    self._locationName = name as! String
                }
                
                if let code = dict["cod"] {
                    self._currentWeatherCodeDescription = code as! Int
                }
                if let time = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: time)
                    let dayFormatter = NSDateFormatter()
                    let dateFormatter = NSDateFormatter()
                    let timeFormatter = NSDateFormatter()
                    dayFormatter.dateFormat = "EEEE"
                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                    timeFormatter.dateFormat = "h:mm a"
                    self._day = dayFormatter.stringFromDate(date)
                    self._date = dateFormatter.stringFromDate(date)
                    self._time = timeFormatter.stringFromDate(date)
                    
                }
                print(self._locationName)
                print(self._currentWeatherCodeDescription)
                print(self._day)
                print(self._date)
                print(self._time)
                //print(dict["cod"]!)
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    
                    if let humidity = main["humidity"] {
                        self._humidity = humidity as! Int
                    }
                    if let temp = main["temp"] {
                        self._currentTemp = temp as! Int
                    }
                    if let tempMin = main["temp_min"] {
                        self._lowTemp = tempMin as! Int
                    }
                    if let tempMax = main["temp_max"] {
                        self._highTemp = tempMax as! Int
                    }
                }
                
                if let sys = dict["sys"] as? Dictionary<String, AnyObject> {
                    if let sunrise = sys["sunrise"] as? NSTimeInterval {
                        let date = NSDate(timeIntervalSince1970: sunrise)
                        let timeFormatter = NSDateFormatter()
                        timeFormatter.dateFormat = "h:mma"
                        self._sunrise = timeFormatter.stringFromDate(date)
                    }
                    
                    if let sunset = sys["sunset"] as? Double {
                        let date = NSDate(timeIntervalSince1970: sunset)
                        let timeFormatter = NSDateFormatter()
                        timeFormatter.dateFormat = "h:mma"
                        self._sunset = timeFormatter.stringFromDate(date)
                    }
                
                
                }
                //print(dict)
            }
            
        }
    
    }
}

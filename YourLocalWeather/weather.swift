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
    private var _currentTemp: String!
    private var _humidity: Int!
    private var _lowTemp: String!
    private var _highTemp: String!
    private var _locationName: String!
    private var _URL_COMPLETE: String!
    private var _URL_ICONBASE: String! = "http://openweathermap.org/img/w/"
    private var _URL_BASE: String! = "http://api.openweathermap.org/data/2.5/weather?"
    private var _URL_FORCAST: String! = "http://api.openweathermap.org/data/2.5/forecast?"
    private var _URL_LOC: String! = "zip=64801,us"
    private var _URL_APPID: String! = "&units=imperial&APPID=c388210d4502949751d13328f1b7ae3d"
    
    
    
    var currentWeatherMain: String {
        if _currentWeatherMain == nil {
            return ""
        }
        return _currentWeatherMain
    }
    var currentWeatherLongDescription: String {
        if _currentWeatherLongDescription == nil {
            return ""
        }
        return _currentWeatherLongDescription
    }
    var currentWeatherShortDescription: String {
        if _currentWeatherShortDescription == nil {
            return ""
        }
        return _currentWeatherShortDescription
    }
    var weatherID: Int {
        if _weatherID == nil {
            return 0
        }
        return _weatherID
    }
    var weatherIconID: String {
        if _weatherIconID == nil {
            return ""
        }
        return _weatherIconID
    }
    var weatherIconImage: UIImage {
        if _weatherIconImage == nil {
            return UIImage(named: "night")!
        }
        return _weatherIconImage
    }
    var dlWeatherIconImage: UIImage {
        if _dlWeatherIconImage == nil {
            return UIImage(named: "cloud")!
        }
        return _dlWeatherIconImage
    }
    var day: String {
        if _day == nil {
            return ""
        }
        return _day
    }
    var date: String {
        if _date == nil {
            return ""
        }
        return _date
    }
    var time: String {
        if _time == nil {
            return ""
        }
        return _time
    }
    var sunrise: String {
        if _sunrise == nil {
            return ""
        }
        return _sunrise
    }
    var sunset: String {
        if _sunset == nil {
            return ""
        }
        return _sunset
    }
    var currentTemp: String {
        if _currentTemp == nil {
            return ""
        }
        return _currentTemp
    }
    var humidity: Int {
        if _humidity == nil {
            return 0
        }
        return _humidity
    }
    var lowTemp: String {
        if _lowTemp == nil {
            return ""
        }
        return _lowTemp
    }
    var highTemp: String {
        if _highTemp == nil {
            return ""
        }
        return _highTemp
    }
    var locationName: String {
        if _locationName == nil {
            print("two")
            return ""
        }
        return _locationName
    }
    
    
    
    init(location: AnyObject) {
        
        if let obj = location as? Int {
            
            self._URL_LOC = "zip=\(obj),us"
            
        } else if let obj = location as? String {
            
            self._URL_LOC = "q=\(obj)"
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
                        let url = "\(self._URL_ICONBASE)\(self._weatherIconID).png"
                        Alamofire.request(.GET, url).response { (request, response, data, error) in
                            if let image = data {
                                self._weatherIconImage = UIImage(data: image, scale: 1)
                                
                            }
                        }
                    }
                    if let id = description[0]["id"] {
                        self._weatherID = id as! Int
                    }

                }
                
                if let name = dict["name"] {
                    self._locationName = name as! String
                }
                
                if let code = dict["cod"] {
                    
                    if let intCode = code as? Int {
                        self._currentWeatherCodeDescription = intCode
                    } else if let intCode = code as? String {
                        self._currentWeatherCodeDescription = Int(intCode)
                    } else if let intCode = code as? AnyObject {
                        self._currentWeatherCodeDescription = Int(intCode as! String)
                    }
                    
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

                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    
                    if let humidity = main["humidity"] {
                        self._humidity = humidity as! Int
                    }
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = NSString(format: "%.0f", temp) as String
                    }
                    if let tempMin = main["temp_min"] as? Double {
                        self._lowTemp = NSString(format: "%.0f", tempMin) as String
                    }
                    if let tempMax = main["temp_max"] as? Double {
                        self._highTemp = NSString(format: "%.0f", tempMax) as String
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
                let furl = "\(self._URL_FORCAST)\(self._URL_LOC)\(self._URL_APPID)"
                Alamofire.request(.GET, furl).responseJSON { response in
                    let result = response.result
                    
                    if let dict = result.value as? Dictionary<String, AnyObject> {
                        
                        if let forecast = dict["list"] as? [Dictionary<String,AnyObject>] {
                            print(forecast[7]["main"]!["temp"])
                            print(forecast[7]["weather"])
                            print(forecast[15]["main"]!["temp"])
                            //print(forecast[15]["weather"]!["icon"])
                        }
                        print(dict["list"])
                        
                    } else {
                        print("Wrong")
                    }
                }
                completed()
            }
            
        }
        
    }

}

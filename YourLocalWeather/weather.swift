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
    
    //main
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
    
    //forecast
    private var _day1Icon: String!
    private var _day1Description: String!
    private var _day1Temp: String!
    private var _day1IconImage: UIImage!
    private var _day2Icon: String!
    private var _day2Description: String!
    private var _day2Temp: String!
    private var _day2IconImage: UIImage!
    private var _day3Icon: String!
    private var _day3Description: String!
    private var _day3Temp: String!
    private var _day3IconImage: UIImage!
    private var _day4Icon: String!
    private var _day4Description: String!
    private var _day4Temp: String!
    private var _day4IconImage: UIImage!
    private var _day5Icon: String!
    private var _day5Description: String!
    private var _day5Temp: String!
    private var _day5IconImage: UIImage!
    
    
    
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
            return ""
        }
        return _locationName
    }
    var day1Temp: String {
        if _day1Temp == nil {
            return ""
        }
        return _day1Temp
    }
    var day1Description: String {
        if _day1Description == nil {
            return ""
        }
        return _day1Description
    }
    var day1Icon: String {
        if _day1Icon == nil {
            return ""
        }
        return _day1Icon
    }
    var day1IconImage: UIImage {
        if _day1IconImage == nil {
            return UIImage(named: "default")!
        }
        return _day1IconImage
    }
    var day2Temp: String {
        if _day2Temp == nil {
            return ""
        }
        return _day2Temp
    }
    var day2Description: String {
        if _day2Description == nil {
            return ""
        }
        return _day2Description
    }
    var day2Icon: String {
        if _day2Icon == nil {
            return ""
        }
        return _day2Icon
    }
    var day2IconImage: UIImage {
        if _day2IconImage == nil {
            return UIImage(named: "default")!
        }
        return _day2IconImage
    }

    var day3Temp: String {
        if _day3Temp == nil {
            return ""
        }
        return _day3Temp
    }
    var day3Description: String {
        if _day3Description == nil {
            return ""
        }
        return _day3Description
    }
    var day3Icon: String {
        if _day3Icon == nil {
            return ""
        }
        return _day3Icon
    }
    var day3IconImage: UIImage {
        if _day3IconImage == nil {
            return UIImage(named: "default")!
        }
        return _day3IconImage
    }

    var day4Temp: String {
        if _day4Temp == nil {
            return ""
        }
        return _day4Temp
    }
    var day4Description: String {
        if _day4Description == nil {
            return ""
        }
        return _day4Description
    }
    var day4Icon: String {
        if _day4Icon == nil {
            return ""
        }
        return _day4Icon
    }
    var day4IconImage: UIImage {
        if _day4IconImage == nil {
            return UIImage(named: "default")!
        }
        return _day4IconImage
    }

    var day5Temp: String {
        if _day5Temp == nil {
            return ""
        }
        return _day5Temp
    }
    var day5Description: String {
        if _day5Description == nil {
            return ""
        }
        return _day5Description
    }
    var day5Icon: String {
        if _day5Icon == nil {
            return ""
        }
        return _day5Icon
    }
    var day5IconImage: UIImage {
        if _day5IconImage == nil {
            return UIImage(named: "default")!
        }
        return _day5IconImage
    }

    
    
    init(location: AnyObject) {
        
        if let obj = location as? Int {
            
            self._URL_LOC = "zip=\(obj),us"
            
        } else if let obj = location as? String {
            
            self._URL_LOC = "q=\(obj)"
        }
        
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
                    } else {
                        let intCode = code
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
                
                let furl = "\(self._URL_FORCAST)\(self._URL_LOC)\(self._URL_APPID)"
                Alamofire.request(.GET, furl).responseJSON { response in
                    let result = response.result
                    
                    if let dict = result.value as? Dictionary<String, AnyObject> {
                        
                        if let forecast = dict["list"] as? [Dictionary<String,AnyObject>] {


                            var temps: [Int] = []
                            var icons: [String] = []
                            var days: [String] = []
                            
                            for x in 0...forecast.count - 1 {
                                if let forecastDate = forecast[x]["dt"] as? Double {
                                    let date = NSDate(timeIntervalSince1970: forecastDate)
                                    let dayFormatter = NSDateFormatter()
                                    let dateFormatter = NSDateFormatter()
                                    let timeFormatter = NSDateFormatter()
                                    dayFormatter.dateFormat = "EEE"
                                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                                    timeFormatter.dateFormat = "h:mm a"

                                    if timeFormatter.stringFromDate(date) == "4:00 PM" {
                                        if let temp = forecast[x]["main"]!["temp_max"] {
                                            temps.append((temp as? Int)! )
                                        }
                                        days.append(dayFormatter.stringFromDate(date))
                                        
                                        
                                        if let weather = forecast[x]["weather"] as? [Dictionary<String, AnyObject>] {
                                            if let icon = weather[0]["icon"] {
                                                icons.append(icon as! String)
                                            }
                                        }

                                    }

                                }
                            }
                            if temps.count > 0 && days.count > 0 && icons.count > 0 {
                                self._day1Temp = "\(temps[0])"
                                self._day1Description = days[0]
                                self._day1Icon = icons[0]
                                                            }
                            if temps.count > 1 && days.count > 1 && icons.count > 1 {
                                self._day2Temp = "\(temps[1])"
                                self._day2Description = days[1]
                                self._day2Icon = icons[1]
                                
                            }
                            if temps.count > 2 && days.count > 2 && icons.count > 2 {
                                self._day3Temp = "\(temps[2])"
                                self._day3Description = days[2]
                                self._day3Icon = icons[2]
                                
                            }
                            if temps.count > 3 && days.count > 3 && icons.count > 3 {
                                self._day4Temp = "\(temps[3])"
                                self._day4Description = days[3]
                                self._day4Icon = icons[3]
                                
                            }
                            if temps.count > 4 && days.count > 4 && icons.count > 4 {
                                self._day5Temp = "\(temps[4])"
                                self._day5Description = days[4]
                                self._day5Icon = icons[4]
                                
                                
                                
                            }
                            completed()

                        
                        }
                        
                        
                        
                    } else {
                        print("Wrong")
                    }
                    
                }
                
                
                
            }
            
        }
        
        
    }
    func getForcastIcon(icon: String,day: String) {
        let url = "\(ICON_URL)\(icon).png"
        Alamofire.request(.GET, url).responseData{ (response) in
            if let result = response.data {
                if day == "one" {
                    self._day1IconImage = UIImage(data: result)
                } else if day == "two" {
                    self._day2IconImage = UIImage(data: result)
                } else if day == "three" {
                    self._day3IconImage = UIImage(data: result)
                } else if day == "four" {
                    self._day4IconImage = UIImage(data: result)
                } else {
                    self._day5IconImage = UIImage(data: result)
                }
            }
            
        }
        
        
        
    }
    

}

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
    private var _sunrise: Double!
    private var _sunset: Double!
    private var _currentTemp: String!
    private var _humidity: String!
    private var _lowTemp: String!
    private var _highTemp: String!
    private var _locationName: String!
    private var _weather_url: String!
    private var _weatherLocation: Int!
    
    
    init(zip: Int) {
        self._weatherLocation = zip
    }
    
    
    func downloadWeather(completed: DownloadComplete) {
    
        let url = "http://api.openweathermap.org/data/2.5/weather?zip=64801,us&APPID=c388210d4502949751d13328f1b7ae3d"
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let description = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    
                    if let longDesc = description[0]["description"] {
                        self._currentWeatherLongDescription = longDesc as! String
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
                    print(self._currentWeatherLongDescription)
                    print(self._currentWeatherShortDescription)
                    print(self._weatherIconID)
                    print(self._weatherID)
                }
                
                if let name = dict["name"] {
                    self._locationName = name as! String
                }
                
                if let code = dict["cod"] {
                    self._currentWeatherCodeDescription = code as! Int
                }
                print(self._locationName)
                print(self._currentWeatherCodeDescription)
                //print(dict["id"]!)
                print(dict["base"]!)
                print(dict["dt"]!)
                print(dict["cod"]!)
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    
                    print(main["grnd_level"]!)
                    print(main["humidity"]!)
                    print(main["pressure"]!)
                    print(main["sea_level"]!)
                    print(main["temp"]!)
                    print(main["temp_min"]!)
                    print(main["temp_max"]!)
                }
                
                if let sys = dict["sys"] as? Dictionary<String,AnyObject> {
                    
                    print(sys["country"]!)
                    print(sys["message"]!)
                    print(sys["sunrise"]!)
                    print(sys["sunset"]!)

                }
                //print(dict)
            }
            
        }
    
    }
}

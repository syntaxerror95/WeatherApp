//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Sahadev Tandur on 23/08/17.
//  Copyright © 2017 Sahadev Tandur. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    private var _date : String!
    private var _temp : String!
    private var _img : String!
    private var _type : String!
    private var _loc : String!
    
    var date : String {
        get {
            let dateformater = DateFormatter()
            dateformater.dateStyle = .medium
            dateformater.timeStyle = .none
            let curdt = dateformater.string(from: Date())
            self._date = "Today" + " " + curdt
            return _date
        }
        set
        {
            _date = newValue
        }
    }
    
        var temp : String {
        get {
            if _temp == nil{
                return ""
            }
            return _temp
        }
        set
        {
            _temp = newValue
            if _temp == nil{
                _temp = ""
            }
//            _temp = newValue
        }
    }
        
        var img : String  {
        get {
            return _img
        }
        set
        {
            _img = newValue
            if _img == nil{
                _img = "Clouds"
            }
//            _img = newValue
        }
    }
        
        var type : String {
        get {
            if _type == nil{
                return ""
            }
            return _type
        }
        set
        {
            _type = newValue
            if _type == nil{
                _type = ""
            }
        }
    }
        
        var loc : String {
        get {
            if _loc == nil{
                return ""
            }
            return _loc
        }
        set
        {
            _loc = newValue
            if _loc == nil{
                _loc = ""
            }
        }
    }
    
        func downloadData(Completed : @escaping DownloadComplete)
        {
            let curweatherURL = URL(string : CurrentURL)!
    //        print(CurrentURL)
    //        print(curweatherURL)
            
            Alamofire.request(curweatherURL).responseJSON { response in
                let result = response.result
    //            print(result)
    //            print(response)
                if let dict = result.value as? Dictionary<String, AnyObject>{
                    
                    if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                        if let name = weather[0]["main"] as? String{
                            self._type = name
                            print("type:" + self.type)
                        }
                    }
                    
                    if let main = dict["main"] as? Dictionary<String,AnyObject> {
                        if let temp = main["temp"] as? Double {
                            self._temp = "\(Int(temp - 273.15))°"
                            print("temp" + self.temp)
                        }
                    }
                    
                    if let name = dict["name"] as? String{
                        self._loc = name
                    }
                }
                        Completed()
                }
        }
    }

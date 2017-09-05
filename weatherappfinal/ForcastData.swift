//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Sahadev Tandur on 23/08/17.
//  Copyright © 2017 Sahadev Tandur. All rights reserved.
//

import Alamofire
import UIKit
class ForcastData {
    private var _img : String!
    private var _day : String!
    private var _type : String!
    private var _maxtemp : Double!
    private var _mintemp : Double!
    
    var img: String {
    get {
        return _img
    }
    set
    {
      _img = newValue
        if(_img == nil){
            _img = ""
        }
    }
    }
    
    var day : String {
    get {
        return _day
    }
    set
    {
        _day = newValue
        if(_day == nil){
            _day = ""
        }

    }
    }

    var type : String {
        get {
        return _type
    }
    set
    {
        _type = newValue
        if(_type == nil){
            _type = ""
        }

    }
    }

    var maxtemp : Double {
    get {
        return _maxtemp
    }
    set
    {
        _maxtemp = newValue
        if(_maxtemp == nil){
            _maxtemp = 0
        }

    }
    }
    
    var mintemp : Double {
    get {
        return _mintemp
    }
    set
    {
        _mintemp = newValue
        if(_mintemp == nil){
            _mintemp = 0
        }

    }
    }
    init(eachdict : Dictionary<String, AnyObject>){
        if let temp = eachdict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                self._mintemp = Double(min - 273.15)
                print("mintemp : " + "\(Int(mintemp))")
            }
            
            if let max = temp["max"] as? Double {
                self._maxtemp = max - 273.15
                print("maxtemp : " + "\(Int(maxtemp))")

            }
            
        }
        
        if let weather = eachdict["weather"] as? [Dictionary<String,AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._type = main
                print("type : " + "\(type)")
            }
        }
        
        if let date = eachdict["dt"] as? Double
        {
            let unixconvertedDate = Date(timeIntervalSince1970: date)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .full
            dateformatter.dateFormat = "EEEE"
            dateformatter.timeStyle = .none
            self._day = unixconvertedDate.DayOfTheWeek()
            print("day : " + "\(day)")

        }
    }
    
    }
extension Date {
    func DayOfTheWeek() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEEE"
        return dateformatter.string(from: self)
    }
}

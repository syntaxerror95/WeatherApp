//
//  Constants.swift
//  WeatherApp
//
//  Created by Sahadev Tandur on 23/08/17.
//  Copyright © 2017 Sahadev Tandur. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON = "&lon="
let APID_KEY = "&appid=ab0dfe8282c253b59f36667cec6e5d8c"

typealias DownloadComplete = () -> ()
let CurrentURL : String = BASE_URL + LAT + "35" + LON + "39" + APID_KEY

let FORCAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=39&cnt=10" + APID_KEY

//
//  HourForecast.swift
//  WeatherApp
//
//  Created by Pete Holdsworth on 23/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// The Forecast class represents the weather forecast at a specific point in time as returned by the Weatherbit.io api for a given location
@objc class Forecast: NSObject {
    
    @objc let timeStamp: Int
    @objc let conditionsCode: Int
    @objc let temperature: Double
    @objc let windSpeed: Double
    @objc let precipitationProbability: Double
    
    init(timeStamp: Int, conditionsCode: Int, temperature: Double, windSpeed: Double, precipitationProbability: Double){
        self.timeStamp = timeStamp
        self.conditionsCode = conditionsCode
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.precipitationProbability = precipitationProbability
    }

}

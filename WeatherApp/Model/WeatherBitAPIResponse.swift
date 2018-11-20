//
//  WeatherBitAPIResponseData.swift
//  WeatherApp
//
//  Created by Pete Holdsworth on 15/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// The WeatherBitAPIResponseData struct represents the top-level object returned from the Weatherbit.io api endpoints
struct WeatherBitAPIResponseData: Decodable {
    let data: [HourForecastData]
}

// 2nd-level object
struct HourForecastData: Decodable {
    let ts: Int
    let weather: WeatherDescription
    let wind_spd :Double
    let temp: Double
    let pop: Double
}

// 3rd -level object
struct WeatherDescription: Decodable {
    let code: Int
}

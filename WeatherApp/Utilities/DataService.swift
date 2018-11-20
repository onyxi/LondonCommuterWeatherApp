//
//  Service.swift
//  WeatherApp
//
//  Created by Pete Holdsworth on 23/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit
import Alamofire

// The DataService class provides access to data from networked sources.
@objc open class DataService: NSObject {
    
    // hold reference to a configured String to be used in a new request
    var urlString: String?
    
    
    // This method configures the url String to be used in the url request for fetching data from the Weatherbit.io api. It takes a boolean value representing whether the request will be for hourly forecast data (instead of daily) and two string values to represent the latitude and longitude of the location to be queried for weather forecast data.
    @objc func configureRequest(hourlyNotDaily: Bool, latitude: String, longitude: String) {
        if hourlyNotDaily == true {
            // construct string for Hourly forecasts endpoint
            urlString = "https://api.weatherbit.io/v2.0/forecast/hourly?lat=\(latitude)&lon=\(longitude)&key=4fd610ac071b4b109697e1f5730ec0e5&hours=48"
        } else {
            // construct string for Daily forecasts endpoint
            urlString = "https://api.weatherbit.io/v2.0/forecast/daily?lat=\(latitude)&lon=\(longitude)&key=4fd610ac071b4b109697e1f5730ec0e5"
        }
    }
    
    
    
    // This method makes a call to the Weatherbit.io api using the urlString, which must already be configured using the configureRequest method. If the call is successful, an array of Forecast objects is returned to the caller.
    @objc func fetchData( completionHandler: @escaping (NSError?, [Forecast]?) -> Void ) {
        
        // check to make sure urlString has been configured, hold local reference to it and set reset variable in main scope
        guard let urlString = self.urlString else {
            // request not configured...
            completionHandler(NSError(), nil)
            return
        }
        self.urlString = nil
        
        // make request using urlString with Alamofire
        Alamofire.request(urlString)
            
            // handle response as JSON - check that call was successful and that data was returned
            .responseJSON { response in
                guard
                    response.result.isSuccess,
                    let data = response.data
                    else {
                        // Download Error...
                        completionHandler(NSError(), nil)
                        return
                }
                
                // attempt to decode JSON data
                do {
                    let responseData = try JSONDecoder().decode(WeatherBitAPIResponseData.self, from: data)
                    
                    var forecasts = [Forecast]()
                    for dataItem in responseData.data {
                        forecasts.append(Forecast(
                            timeStamp: dataItem.ts,
                            conditionsCode: dataItem.weather.code,
                            temperature: dataItem.temp,
                            windSpeed: dataItem.wind_spd,
                            precipitationProbability: dataItem.pop)
                        )
                    }
                    
                    // if successful return data as array of Forecast objects
                    completionHandler(nil, forecasts)
                    
                    // if error decoding JSON data, pass error back to delegate
                } catch let jsonErr {
                    completionHandler(jsonErr as NSError, nil)
                }
        }
        
    }

    

}

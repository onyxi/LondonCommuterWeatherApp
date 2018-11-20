//
//  Constants.swift
//  WeatherApp
//
//  Created by Pete Holdsworth on 23/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// The Constants class holds static values for globally accessed constant values
@objc open class Constants: NSObject {
    
    // instanciate singleton
    static let instance = Constants()
    
    // values for UserDefaults keys
    @objc let LOCATION_MAIN = "london"
    @objc let LOCATION_HOME = "homeLocation"
    @objc let LOCATION_WORK = "workLocation"
    @objc let AM_START = "amStart"
    @objc let AM_END = "amEnd"
    @objc let PM_START = "pmStart"
    @objc let PM_END = "pmEnd"
    
    // dictionary with Location objects for pickable london boroughs
    @objc let LOCATIONS = [
        "Camden" : Location(name: "Camden", latitude: "51.551667", longitude: "-0.161136"),
        "Chelsea" : Location(name: "Chelsea", latitude: "51.489998", longitude: "-0.176010"),
        "Greenwich" : Location(name: "Greenwich", latitude: "51.475458", longitude: "0.055754"),
        "Hackney" : Location(name: "Hackney", latitude: "51.555087", longitude: "-0.061373"),
        "Hammersmith" : Location(name: "Hammersmith", latitude: "51.495005", longitude: "-0.227347"),
        "Islington" : Location(name: "Islington", latitude: "51.550643", longitude: "-0.108586"),
        "Kensington" : Location(name: "Kensington", latitude: "51.509707", longitude: "-0.205975"),
        "Lambeth" : Location(name: "Lambeth", latitude: "51.453761", longitude: "-0.119586"),
        "Lewisham" : Location(name: "Lewisham", latitude: "51.446454", longitude: "-0.017005"),
        "Southwark" : Location(name: "Southwark", latitude: "51.480407", longitude: "-0.076910"),
        "Tower Hamlets" : Location(name: "Tower Hamlets", latitude: "51.520028", longitude: "-0.023312"),
        "Wandsworth" : Location(name: "Wandsworth", latitude: "51.445721", longitude: "-0.195012"),
        "Westminster" : Location(name: "Westminster", latitude: "51.475458", longitude: "0.055754")
    ]

    
    
}


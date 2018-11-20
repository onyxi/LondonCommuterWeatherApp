//
//  Location.swift
//  WeatherApp
//
//  Created by Pete Holdsworth on 18/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import Foundation

// The Location class represents a given geographical location, including the name of a London borough and its 2D coordinates
@objc class Location: NSObject {
    
    let name: String!
    let latitude: String!
    let longitude: String!
    
    init(name: String, latitude: String, longitude: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

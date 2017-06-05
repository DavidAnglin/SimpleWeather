//
//  Coordinate.swift
//  SimpleWeather
//
//  Created by David Anglin on 6/4/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}

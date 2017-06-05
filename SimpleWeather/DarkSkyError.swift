//
//  DarkSkyError.swift
//  SimpleWeather
//
//  Created by David Anglin on 6/4/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingFailure
}

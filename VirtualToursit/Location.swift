//
//  Location.swift
//  VirtualToursit
//
//  Created by Robert Jeffers on 2/22/21.
//

import Foundation

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let location: String
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case location, country, latitude, longitude
    }
}


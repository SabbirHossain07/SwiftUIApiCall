//
//  Course.swift
//  SwiftUIApi
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

struct Course: Hashable, Codable {
    let resourceType: String
    let url: String
    let status: String
    let expansion: Expansion
}

struct Expansion: Hashable, Codable{
    let timestamp: String
    let total: Int
    let contains:[Contains]
}

struct Contains: Hashable, Codable{
    let code: String?
    let system: String?
    let display: String?
}

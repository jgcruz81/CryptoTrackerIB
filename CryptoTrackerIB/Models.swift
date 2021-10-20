//
//  Models.swift
//  CryptoTrackerIB
//
//  Created by Juan Cruz on 10/20/21.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}

//
//  ModelVC.swift
//  Z2
//
//  Created by Zed on 1/12/21.
//

import Foundation

public class ModelVc {
    
    struct Banners: Codable {
    let data: [Banner]
    }

    struct Banner: Codable {
        let image: ImageOption
    }

    struct ImageOption: Codable {
        let large: String
        let original: String
    }

    struct Listings: Codable {
        let data: [Listing]
    }

    struct Listing: Codable {
        let view_count: Int
        let listing_age: Int /// 0 => new lisitng else ... days on z1
        let favorite: Bool
        let land_area: Double
        let short_address: String
        let property_type: String
        let image: ImageOption
    }

    
    
}

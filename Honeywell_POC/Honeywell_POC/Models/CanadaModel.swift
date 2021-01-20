//
//  CanadaModel.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import Foundation

// MARK: - CanadaModel
struct CanadaModel: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Row Model
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}

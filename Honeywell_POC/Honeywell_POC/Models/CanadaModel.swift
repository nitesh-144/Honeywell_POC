//
//  CanadaModel.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import Foundation

//MARK:- Codable struct model to map main json response
struct CanadaModel: Codable{
    var title: String = ""
    var rows: [CanadaDetailModel] = []
}

//MARK:- Codable struct model to map detail response
struct CanadaDetailModel: Codable{
    var title:String?
    var description: String?
    var imageHref: URL?
}

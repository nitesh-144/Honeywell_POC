//
//  Configuration.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import Foundation

//MARK:- Enum to map different server environment
enum ServerEnvironment{
    
    case development
    case uat
    case production
    
    //Method to get the appropriate base url
    func getBaseURL() -> String{
        switch self{
        case .development:
            return "https://dl.dropboxusercontent.com/"
        case .uat:
            return "https://dl.dropboxusercontent.com/"
        case .production:
            return "https://dl.dropboxusercontent.com/"
        }
    }
}

//MARK:- Enum to map all available api endpoints
enum APIEndPoints{
    
    case getDetailAboutCanada
    
    //Method to get the appropriate endpoint url
    func getURL() -> URL?{
        
        var apiEndPoint = APPConstants.CURRENT_SERVER_ENVIRONMENT.getBaseURL()
        switch self{
        case .getDetailAboutCanada:
            apiEndPoint += "s/2iodh4vg0eortkl/facts.json"
        }
        
        return URL(string: apiEndPoint)
    }
}

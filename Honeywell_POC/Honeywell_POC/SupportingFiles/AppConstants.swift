//
//  AppConstants.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import Foundation

//MARK:- Struct to maintain all App's global configurational strings and constants
struct APPConstants{
    
    public static let CURRENT_SERVER_ENVIRONMENT = ServerEnvironment.development
    
    //To manage API Messages
    struct APIStrings{
        public static let RESPONSE_FAILED_ERROR = "API Response failed"
        public static let STATUS_CODE_ERROR = "Getting error in status code"
        public static let PAGE_NOT_FOUND_ERROR = "Page not found"
        public static let SUCCESS_RESPONSE_MESSAGE = "Records found successfully"
        public static let DATA_PARSING_ERROR = "Records found successfully"
    }
}

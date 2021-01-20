//
//  APIManager.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import Foundation

//Singleton APIManager class
class APIManager{
    
    //MARK:- public and static shared constant
    public static let shared = APIManager()
    
    //MARK:- private init() to create singleton object
    private init(){}
    
    //MARK:- methods
    func processAPIRequest<T:Codable>(forRequestMethod requestMethod:APIMethod, withAPIEndpoint endpointURL:URL, completionHandler : @escaping ((Bool,String,T?) -> Void)){
        
        //setting up http url request
        var request = URLRequest(url: endpointURL)
        request.httpMethod = requestMethod.rawValue
        
        if requestMethod == .post{
            //according to the type of request method, can process the urlrequest
        }
        
        //configure urlsession
        URLSession.shared.dataTask(with: request) { (responseData, urlResponse, error) in
            if error == nil{
                //success
                if let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode, let status = HTTPStatusCodes(rawValue: statusCode){
                    switch status{
                    case ._200:
                        do{
                            let utf8String = String(data: responseData!, encoding: .isoLatin1)
                            if let dataFromUTF8String = utf8String!.data(using: .utf8){
                                let responseObj = try JSONDecoder().decode(T.self, from: dataFromUTF8String)
                                completionHandler(true,APPConstants.APIStrings.SUCCESS_RESPONSE_MESSAGE,responseObj)
                            }else{
                                completionHandler(false,APPConstants.APIStrings.DATA_PARSING_ERROR,nil)
                            }
                        }catch let error{
                            completionHandler(false,error.localizedDescription,nil)
                        }
                    case ._404:
                        completionHandler(false,APPConstants.APIStrings.PAGE_NOT_FOUND_ERROR,nil)
                    }
                }else{
                    completionHandler(false,APPConstants.APIStrings.STATUS_CODE_ERROR,nil)
                }
            }else{
                completionHandler(false,APPConstants.APIStrings.RESPONSE_FAILED_ERROR,nil)
            }
        }.resume()
    }
}

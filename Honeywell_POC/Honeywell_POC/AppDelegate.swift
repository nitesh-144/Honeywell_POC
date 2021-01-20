//
//  AppDelegate.swift
//  Honeywell_POC
//
//  Created by Deepika on 20/01/21.
//  Copyright © 2021 freedom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //Setting up the UI
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: Bundle.main)
        let rootVC = homeStoryboard.instantiateViewController(withIdentifier: "MainNavController") as! UINavigationController
        application.keyWindow?.rootViewController = rootVC
        application.keyWindow?.makeKeyAndVisible()

        //Test code to check the api response
        APIManager.shared.processAPIRequest(forRequestMethod: .get, withAPIEndpoint: APIEndPoints.getDetailAboutCanada.getURL()!) { (flag, message, record:CanadaModel?) in
            
            if flag == true{
                print("Done")
            }else{
                print(message)
            }
        }
        return true
    }

    


}


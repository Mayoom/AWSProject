//
//  AppDelegate.swift
//  AWSProject
//
//  Created by Maryamalmoqbali on 2/29/20.
//  Copyright © 2020 Maryamalmoqbali. All rights reserved.
//

import UIKit
import AWSMobileClient
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast2,
//           identityPoolId:"us-east-2:0d0d5ba1-f89c-4367-a1be-414509a59bf6")
//
//        let configuration = AWSServiceConfiguration(region:.USEast2, credentialsProvider:credentialsProvider)
//
//
        return AWSMobileClient.default().interceptApplication(
                    application, didFinishLaunchingWithOptions:
                    launchOptions)
    }
    
    // Add a AWSMobileClient call in application:open url
      func application(_ application: UIApplication, open url: URL,
          sourceApplication: String?, annotation: Any) -> Bool {

        return AWSMobileClient.default().interceptApplication(
              application, open: url,
              sourceApplication: sourceApplication,
              annotation: annotation)

      }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


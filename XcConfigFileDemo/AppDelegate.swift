//
//  AppDelegate.swift
//  XcConfigFileDemo
//
//  Created by Arshad Shaik on 23/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let baseUrl = Config.baseURL
        print("base url is ", baseUrl)
        return true
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

public enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist not found")
        }
        return dict
    }()
    
    static let baseURL: URL = {
        guard let baseURL = Config.infoDictionary[Keys.baseURL.rawValue] as? String else {
            fatalError("Base URL not set in plist")
        }
        guard let url = URL(string: baseURL) else {
            fatalError("Base URL is invalid")
        }
        return url
    }()
    
    private enum Keys: String {
        case baseURL = "BASE_URL"
    }
}

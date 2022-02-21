//
//  AppDelegate.swift
//  Risuto
//
//  Created by Rodolfo Helfenstein on 20/02/22.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@main
class AppDelegate: UIResponder {

    var window: UIWindow?

}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UIViewController()
        self.window?.makeKeyAndVisible()

        return true
    }

}

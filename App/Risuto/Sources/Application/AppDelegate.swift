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
    var appRouter: AppRouter?

}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool
    {

        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        self.appRouter = AppRouter(navigationController: navigationController)
        self.appRouter?.start()

        return true
    }

}

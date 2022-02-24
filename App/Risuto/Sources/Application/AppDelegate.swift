//
//  AppDelegate.swift
//  Risuto
//
//  Created by Rodolfo Helfenstein on 20/02/22.
//

import UIKit
import Network

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@main
class AppDelegate: UIResponder {

    var window: UIWindow?
    var appRouter: AppRouter?

    private func makeNavigation() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .black
        return navigationController
    }

    private func makeNetwork() -> Network {
        return NetworkManager(session: URLSession.shared)
    }

}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool
    {

        let navigationController = makeNavigation()
        let network = makeNetwork()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        self.appRouter = AppRouter(navigationController: navigationController, network: network)
        self.appRouter?.start()

        return true
    }

}

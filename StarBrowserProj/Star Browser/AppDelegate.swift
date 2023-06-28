//
//  AppDelegate.swift
//  Star Browser
//
//  Created by Островский Лев Владимирович on 05.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		UserDefaults.isPremium = false
		if UserDefaults.isPremium == nil {
			UserDefaults.isPremium = false
		}

		if UserDefaults.currentServer.isEmpty {
			UserDefaults.currentServer = SFSearchEngine.shared.searchDomain
		}

		let mainViewController = MainViewController()
		let navController = NavigationController(rootViewController: mainViewController)
        UserDefaults.ping = 0
        UserDefaults.uploadSpeed = 0
        UserDefaults.downloadSpeed = 0
		window?.rootViewController = navController
		window?.makeKeyAndVisible()
        NetworkInfoService.shared.getInfo()
		return true
	}
}

class NavigationController: UINavigationController {
	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}
}

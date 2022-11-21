//
//  AppDelegate.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit

private typealias `Self` = AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - Life Cycles

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupWindow()

        return true
    }
}

extension Self {
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
    }
}

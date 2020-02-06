//
//  SceneDelegate.swift
//  CountdownRingDemo
//
//  Created by Yoshinori Imajo on 2020/02/05.
//  Copyright © 2020 Curiosity Software Inc. All rights reserved.
//

import UIKit
import SwiftUI
import CountdownRing

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView(countdownTimer: CountdownTimer(limitTimeInteraval: 10))

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}


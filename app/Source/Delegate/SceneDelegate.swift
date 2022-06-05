//
//  SceneDelegate.swift
//  app
//
//  Created by Ney Moura on 12/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let rootController: UIViewController = ViewControllerFactory.makeSearchViewController()
        window = UIWindow(frame: .zero)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootController
        window?.windowScene = windowScene
    }
}


//
//  SceneDelegate.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let currencyConverterStoryboard = UIStoryboard(name: "CurrencyConverterScreenViewController", bundle: nil)
        guard let currencyConverterViewController = currencyConverterStoryboard.instantiateInitialViewController()
                as? CurrencyConverterScreenViewController else { return }
        navigationController.viewControllers = [currencyConverterViewController]
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}
    

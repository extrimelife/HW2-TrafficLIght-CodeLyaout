//
//  SceneDelegate.swift
//  TrafficLight
//
//  Created by roman Khilchenko on 31.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        
        let trafficLightController = ViewController()
        let navigationController = UINavigationController(rootViewController: trafficLightController)
        let window = UIWindow(windowScene: windowsScene)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
    
}

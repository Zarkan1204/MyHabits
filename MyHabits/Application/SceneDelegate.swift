//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Мой Macbook on 16.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let habitsViewController = HabitsViewController()
        let novigationHabitsController = UINavigationController(rootViewController: habitsViewController)
        novigationHabitsController.tabBarItem.title = "Привычки"
        novigationHabitsController.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        
        let infoViewController = InfoViewController()
        let novigationInfoController = UINavigationController(rootViewController: infoViewController)
        novigationInfoController.tabBarItem.title = "Информация"
        novigationInfoController.tabBarItem.image = UIImage(systemName: "info.circle.fill")

        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [novigationHabitsController, novigationInfoController]
        tabViewController.tabBar.tintColor = UIColor.systemBlue
 
        window.rootViewController =  tabViewController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Дмитрий on 21.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

// =============== Создали ленту пользователя

    let feedViewController = FeedViewController()
 
    let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)

//        feedViewController.title = "Лента"
//        feedViewController.view.backgroundColor = .systemYellow

// =============== Создали профиль пользователя

    let profileViewController = ProfileViewController()
  
    let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)

//        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(contentsOfFile: profileImage), tag: 1)


//        profileViewController.title = "Профиль"
//        profileViewController.view.backgroundColor = .systemOrange

// =============== Создали tabBarController и поместили в него 2 контроллера - лента и профиль
        let tabBarController = UITabBarController()

//Это правильный код!
//        let controllers = [feedViewController, profileViewController]
//        tabBarController.viewControllers = controllers.map {
//                UINavigationController(rootViewController: $0)
//            }

        tabBarController.viewControllers = [feedNavigationController,profileNavigationController]


        UITabBar.appearance().backgroundColor = .lightGray
//        UITabBar.appearance().tintColor = .black
//        UITabBar.appearance().unselectedItemTintColor = .black


// Настроили окно при запуске программыы

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


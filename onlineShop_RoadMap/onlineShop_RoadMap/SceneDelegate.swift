//
//  SceneDelegate.swift
//  onlineShop_RoadMap
//
//  Created by Dima Kovrigin on 10.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private enum Constants {
        static let laptopAndPhoneImageName = "laptopcomputer.and.iphone"
        static let laptopAndPhoneTitle = "Купить"
        static let personImageName = "person.circle"
        static let personTitle = "Для вас"
        static let searchTitle = "Поиск"
        static let searchImageName = "magnifyingglass"
        static let backetImageName = "bag"
        static let backetTitle = "Корзина"
    }

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
         guard let scene = (scene as? UIWindowScene) else { return }
         window = UIWindow(windowScene: scene)

         let tabBar = UITabBarController()

         let buyViewController = UINavigationController(rootViewController: BuyViewController())
         let forYouViewController = UINavigationController(rootViewController: ForYouViewController())
         let searchViewController = UINavigationController(rootViewController: SearchViewController())
         let backetViewContoller = UINavigationController(rootViewController: BasketViewController())

        createTabBarItem(viewController: buyViewController,
                         title: Constants.laptopAndPhoneTitle,
                         nameImage: Constants.laptopAndPhoneImageName,
                         tag: 0
        )

        createTabBarItem(viewController: forYouViewController,
                         title: Constants.personTitle,
                         nameImage: Constants.personImageName,
                         tag: 1
        )

        createTabBarItem(viewController: searchViewController,
                         title: Constants.searchTitle,
                         nameImage: Constants.searchImageName,
                         tag: 3
        )

        createTabBarItem(viewController: backetViewContoller,
                         title: Constants.backetTitle,
                         nameImage: Constants.backetImageName,
                         tag: 4
        )

         tabBar.setViewControllers(
             [buyViewController, forYouViewController, searchViewController, backetViewContoller],
             animated: false
         )

         tabBar.tabBar.unselectedItemTintColor = .gray
         tabBar.tabBar.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)

         window?.rootViewController = tabBar
         window?.makeKeyAndVisible()
    }

    func createTabBarItem(viewController: UIViewController, title: String, nameImage: String, tag: Int) {
        viewController.tabBarItem = UITabBarItem(
            title: title, image: UIImage(systemName: nameImage,
                                             withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), tag: tag
        )
    }
}

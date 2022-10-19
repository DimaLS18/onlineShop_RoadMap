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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        if UserStorage.shared.verifyUser(forKey: ConstantsUser.isEntry) == false {
            window.rootViewController = OnboardingPageViewController(transitionStyle: .scroll,
                                                                     navigationOrientation: .horizontal,
                                                                     options: nil)
        } else {
            window.rootViewController = MainTabBarController()
        }
        self.window = window
        window.makeKeyAndVisible()
    }
}

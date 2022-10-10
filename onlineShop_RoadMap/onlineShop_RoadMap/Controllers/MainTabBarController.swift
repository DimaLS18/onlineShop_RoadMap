//
//  MainTabBarController.swift
//  StoreProject_RoadMap
//
//  Created by Dima Kovrigin on 07.10.2022.
//

import UIKit
/// экран  TabBar
final class MainTabBarController: UITabBarController {

    // MARK: - Private Visual Component
    private lazy var buyVC: UIViewController = {
        var viewController = BuyViewController()
        viewController.tabBarItem = UITabBarItem(title: "Купить",
                                                 image: UIImage(named: "laptop"),
                                                 tag: 0)
        return viewController
    }()

    private var forYouVC: UIViewController = {
        var viewController = ForYouViewController()
        viewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                 image: UIImage(systemName: "person.circle"),
                                                 tag: 1)
        return viewController
    }()

    private var searchVC: SearchViewController = {
        var viewController = SearchViewController()
        viewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                 image: UIImage(systemName: "magnifyingglass"),
                                                 tag: 2)
        return viewController
    }()

    private var bascetVC: UIViewController = {
        var viewController = BasketViewController()
        viewController.tabBarItem = UITabBarItem(title: "Корзина",
                                                 image: UIImage(systemName: "bag"),
                                                 tag: 3)
        return viewController
    }()

    private lazy var  searchNavigationController = UINavigationController(rootViewController: searchVC)
 // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
// MARK: - Private Methods
    private func setupView() {
        viewControllers = [buyVC, forYouVC, searchVC, bascetVC]
        tabBar.barTintColor = .black

    }
}

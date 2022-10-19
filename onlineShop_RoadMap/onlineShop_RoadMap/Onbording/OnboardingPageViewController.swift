//
//  OnboardingPageViewController.swift
//  onlineShop_RoadMap
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit

/// Onboarding page controller
final class OnboardingPageViewController: UIPageViewController {
    
    // MARK: - Private Constants.
    
    private enum Constants {
        static let buyTitle = "Совершайте покупки не выходя из дома"
        static let knowledgeTitle = "Узнавайте о новинках первыми"
        static let economyTitle = "Экономьте с нашей системой лояльности"
        static let buyDescription = "Более 10000 актуальных позиций"
        static let knowledgeDescription = "Быстрые обновления и возможность предзаказов"
        static let economyDescription = "Гибкая система лояльности и возможность рассрочки"
        static let buyImageName = "page1"
        static let knowledgeImageName = "page2"
        static let economyImageName = "page3"
        static let skipTitle = "Пропустить"
        static let nextTitle = "Дальше"
        static let getStartedTitle = "Начинаем!"
        static let initialEntryKey = "firstEntry"
    }
    
    // MARK: - Public properties.
    var pages: [UIViewController] = [OnboardingViewController(headerText: Constants.buyTitle,
                                                              descriptionText: Constants.buyDescription,
                                                              imageName: Constants.buyImageName),
                                     OnboardingViewController(headerText: Constants.knowledgeTitle,
                                                              descriptionText: Constants.knowledgeDescription,
                                                              imageName: Constants.knowledgeImageName),
                                     OnboardingViewController(headerText: Constants.economyTitle,
                                                              descriptionText: Constants.economyDescription,
                                                              imageName: Constants.economyImageName)]
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonBottomAnchor: NSLayoutConstraint?
    var nextButtonBottomAnchor: NSLayoutConstraint?
    var getStartedBottomAnchor: NSLayoutConstraint?
    let pageControl = UIPageControl()
    
    // MARK: - Private properties.
    private let skipButton = UIButton()
    private let nextButton = UIButton()
    private let getStartedButton = UIButton()
    private let initialPage = 0
    
    // MARK: - Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    // MARK: - Private visual components.
    private func setupSubviews() {
        configurePageController()
        createPageControl()
        createSkipButton()
        createNextButton()
        createGetStartedButton()
        setupConstraintsForPageControl()
        setupConstraintsForSkipButton()
        setupConstraintsForNextButton()
        setupConstraintsForGetStartedButton()
        setupConstraintForAnimationElements()
    }
    
    private func configurePageController() {
        dataSource = self
        delegate = self
        setViewControllers([pages[initialPage]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    private func createPageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pages.count
        pageControl.isEnabled = false
        pageControl.currentPage = initialPage
        view.addSubview(pageControl)
    }
    
    private func createSkipButton() {
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.gray, for: .normal)
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle(Constants.skipTitle, for: .normal)
        skipButton.addTarget(self,
                             action: #selector(skipAction),
                             for: .touchUpInside)
        view.addSubview(skipButton)
    }
    private func createNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.setTitle(Constants.nextTitle, for: .normal)
        nextButton.addTarget(self,
                             action: #selector(nextAction),
                             for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    private func createGetStartedButton() {
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitleColor(.systemBlue, for: .normal)
        getStartedButton.setTitle(Constants.getStartedTitle, for: .normal)
        getStartedButton.addTarget(self,
                                   action: #selector(getStartedAction),
                                   for: .touchUpInside)
        view.addSubview(getStartedButton)
    }
    private func setupConstraintsForPageControl() {
        NSLayoutConstraint.activate([
            pageControl.widthAnchor
                .constraint(equalToConstant: 150),
            pageControl.heightAnchor
                .constraint(equalToConstant: 20),
            pageControl.centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupConstraintsForSkipButton() {
        NSLayoutConstraint.activate([
            skipButton.leadingAnchor
                .constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                            multiplier: 2)
        ])
    }
    private func setupConstraintsForNextButton() {
        NSLayoutConstraint.activate([
            view.trailingAnchor
                .constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor,
                            multiplier: 4)
        ])
    }
    private func setupConstraintsForGetStartedButton() {
        NSLayoutConstraint.activate([
            getStartedButton.widthAnchor
                .constraint(equalToConstant: 150),
            getStartedButton.heightAnchor
                .constraint(equalToConstant: 20),
            getStartedButton.centerXAnchor
                .constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setupConstraintForAnimationElements() {
        pageControlBottomAnchor = view.bottomAnchor
            .constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor,
                        multiplier: 2)
        skipButtonBottomAnchor = view.bottomAnchor
            .constraint(equalToSystemSpacingBelow: skipButton.bottomAnchor,
                        multiplier: 2)
        nextButtonBottomAnchor = view.bottomAnchor
            .constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor,
                        multiplier: 2)
        getStartedBottomAnchor = view.bottomAnchor
            .constraint(equalToSystemSpacingBelow: getStartedButton.bottomAnchor,
                        multiplier: 2)
        pageControlBottomAnchor?.isActive = true
        skipButtonBottomAnchor?.isActive = true
        nextButtonBottomAnchor?.isActive = true
        getStartedBottomAnchor?.isActive = true
        getStartedBottomAnchor?.constant = -16
    }
    // MARK: - Private actions.
    @objc private func skipAction(_ sender: UIButton) {
        let lastPage = pages.count - 1
        pageControl.currentPage = lastPage
        goToLastPage(index: lastPage, ofViewControllers: pages)
        animateControlsOnLastPage()
    }
    @objc private func nextAction(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        animateControlsOnLastPage()
    }
    @objc private func getStartedAction(_ sender: UIButton) {
        UserStorage.shared.saveUser(forKey: Constants.initialEntryKey)
        let mainTabBarVC = MainTabBarController()
        mainTabBarVC.modalPresentationStyle = .fullScreen
        present(mainTabBarVC, animated: true)
    }
    private func goToNextPage(animated: Bool = true,
                              completion: ((Bool) -> Void)? = nil) {
        guard
            let currentPage = viewControllers?.first,
            let nextPage = dataSource?.pageViewController(self,
                                                          viewControllerAfter: currentPage)
        else {
            return
        }
        setViewControllers([nextPage],
                           direction: .forward,
                           animated: animated,
                           completion: completion)
    }
    private func goToLastPage(index: Int,
                              ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
}
// MARK: - Extension UIPageViewControllerDelegate
    extension OnboardingPageViewController: UIPageViewControllerDelegate {

    // MARK: - Public methods.
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard
            let viewControllers = pageViewController.viewControllers,
            let currentIndex = pages.firstIndex(of: viewControllers[0])
        else {
            return
        }
        pageControl.currentPage = currentIndex
        animateControlsOnLastPage()
    }

    func animateControlsOnLastPage() {
        let lastPage = pageControl.currentPage == pages.count - 1
        if lastPage {
            hideControls()
            showGetStartedButton()
        } else {
            showControls()
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5,
                                                       delay: 0,
                                                       options: [.curveEaseOut],
                                                       animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    // MARK: - Private methods.
    private func hideControls() {
        pageControlBottomAnchor?.constant = -80
        skipButtonBottomAnchor?.constant = -80
        nextButtonBottomAnchor?.constant = -80
    }

    private func showControls() {
        pageControlBottomAnchor?.constant = 16
        skipButtonBottomAnchor?.constant = 16
        nextButtonBottomAnchor?.constant = 16
        getStartedBottomAnchor?.constant = -16
    }
    private func showGetStartedButton() {
        getStartedBottomAnchor?.constant = 16
    }
}
// MARK: - Extension UIPageViewControllerDataSource
extension OnboardingPageViewController: UIPageViewControllerDataSource {

    // MARK: - Public methods.
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

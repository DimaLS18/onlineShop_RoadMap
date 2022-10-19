//
//  OnboardingViewController.swift
//  onlineShop_RoadMap
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit

/// Onboarding screen with visual components.
final class OnboardingViewController: UIViewController {
    
    // Private Constants.
    private enum Constants {
        static let timeNewRomBoldFont = "Times New Roman Bold"
        static let timeNewRomFont = "Times New Roman"
        static let requiredInitError = "init(coder:) has not been implemented"
    }
    
    // MARK: - Private properties.
    private let onboardingImageView = UIImageView()
    private lazy var onboardingHeaderLabel = UILabel()
    private lazy var onboardingDescriptionLabel = UILabel()
    
    // MARK: - Init.
    init(headerText: String, descriptionText: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        onboardingImageView.image = UIImage(named: imageName)
        onboardingHeaderLabel.text = headerText
        onboardingDescriptionLabel.text = descriptionText
    }
    
    // MARK: - Required init.
    required init?(coder: NSCoder) {
        fatalError(Constants.requiredInitError)
    }
    
    // MARK: - Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        prepareAnimations()
    }
    
    // MARK: - Private visual components.
    private func setupSubviews() {
        createOnboardingImageView()
        createOnboardingTitle()
        createOnboardingSubtitle()
        setupConstraintsForImage()
        setupConstraintsForTitle()
        setupConstraintsForSubtitle()
    }
    
    private func createOnboardingImageView() {
        onboardingImageView.translatesAutoresizingMaskIntoConstraints = false
        onboardingImageView.contentMode = .scaleAspectFit
        view.addSubview(onboardingImageView)
    }
    
    private func createOnboardingTitle() {
        onboardingHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingHeaderLabel.textColor = .black
        onboardingHeaderLabel.alpha = 0
        onboardingHeaderLabel.numberOfLines = 0
        onboardingHeaderLabel.textAlignment = .center
        onboardingHeaderLabel.font = UIFont(name: Constants.timeNewRomBoldFont, size: 25)
        view.addSubview(onboardingHeaderLabel)
    }
    
    private func createOnboardingSubtitle() {
        onboardingDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingDescriptionLabel.font = UIFont(name: Constants.timeNewRomFont, size: 18)
        onboardingDescriptionLabel.alpha = 0
        onboardingDescriptionLabel.textColor = .black
        onboardingDescriptionLabel.textAlignment = .center
        onboardingDescriptionLabel.numberOfLines = 0
        view.addSubview(onboardingDescriptionLabel)
    }
    
    private func setupConstraintsForImage() {
        NSLayoutConstraint.activate([
            onboardingImageView.topAnchor
                .constraint(equalTo: view.topAnchor),
            onboardingImageView.leftAnchor
                .constraint(equalTo: view.leftAnchor),
            onboardingImageView.bottomAnchor
                .constraint(equalTo: view.bottomAnchor),
            onboardingImageView.rightAnchor
                .constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupConstraintsForTitle() {
        NSLayoutConstraint.activate([
            onboardingHeaderLabel.topAnchor
                .constraint(equalTo: onboardingImageView.centerYAnchor, constant: 150),
            onboardingHeaderLabel.leftAnchor
                .constraint(equalTo: view.leftAnchor, constant: 30),
            onboardingHeaderLabel.rightAnchor
                .constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    private func setupConstraintsForSubtitle() {
        NSLayoutConstraint.activate([
            onboardingDescriptionLabel.topAnchor
                .constraint(equalTo: onboardingHeaderLabel.bottomAnchor, constant: 30),
            onboardingDescriptionLabel.leftAnchor
                .constraint(equalTo: view.leftAnchor, constant: 30),
            onboardingDescriptionLabel.rightAnchor
                .constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    // MARK: Private actions
    private func prepareAnimations() {
        onboardingHeaderLabel.alpha = 0
        onboardingDescriptionLabel.alpha = 0
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 2) {
            self.onboardingHeaderLabel.alpha = 1.0
            self.onboardingDescriptionLabel.alpha = 1.0
        }
    }
}

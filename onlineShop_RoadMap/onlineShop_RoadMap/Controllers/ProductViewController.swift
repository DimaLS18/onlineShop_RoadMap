//
//  ProductViewController.swift
//  OnlineShopTest
//
//  Created by Dima Kovrigin on 11.10.2022.
//

import UIKit

final class ProductViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let compatibilityLabelText: NSString = "Совместимо с MacBook  — Дмитрий"
        static let addToBusketButtonText = "Добавить в корзину"
        static let orderInfoLabelText: NSString = """
          Заказ сегодня в течении дня, доставка:
          Чт 13 Окт - Бесплатно
          Варианты доставки для местоположения 142500
  """
    }
    // MARK: - Visual Components
    private let productInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 2
        label.frame = CGRect(x: 10, y: 100, width: 400, height: 50)
        return label
    }()
    private let productInfoSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13)
        label.frame = CGRect(x: 50, y: 370, width: 400, height: 50)
        return label
    }()
    private let productCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.frame = CGRect(x: 140, y: 140, width: 300, height: 30)
        return label
    }()
    private lazy var grayColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 200, y: 450, width: 40, height: 40)
        button.addTarget(self, action: #selector(grayIsSelectedAction), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    private let grayColorIsSelectedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.frame = CGRect(x: 197, y: 447, width: 46, height: 46)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    private lazy var lightGrayColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 450, width: 40, height: 40)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(lightGrayIsSelectedAction), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
    private let lightGrayColorIsSelectedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 23
        button.frame = CGRect(x: 147, y: 447, width: 46, height: 46)
        return button
    }()
    private let compatibilityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.frame = CGRect(x: 65, y: 540, width: 300, height: 30)
        return label
    }()
    private let checkMarkButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 35, y: 542, width: 25, height: 25)
        button.tintColor = .green
        return button
    }()
    private let addToBusketButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.addToBusketButtonText, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: 10, y: 600, width: 370, height: 40)
        return button
    }()
    private let orderInfoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 670, width: 500, height: 70)
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        return label
    }()
    private let boxButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.frame = CGRect(x: 10, y: 680, width: 20, height: 20)
        return button
    }()
    // MARK: - Public properties
    var product: Product?
    var productScrollView = UIScrollView()
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBar(largeType: false, color: .secondarySystemBackground)
        createBarButtonItems()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        customNavigationBar(largeType: true, color: .clear)
    }
    // MARK: - Private methods
    private func setupUI() {
        productInfoLabel.text = product?.name
        productCostLabel.text = product?.price
        productInfoSecondLabel.text = product?.name
        view.addSubview(productInfoLabel)
        view.addSubview(productInfoSecondLabel)
        view.addSubview(compatibilityLabel)
        view.addSubview(checkMarkButton)
        view.addSubview(productCostLabel)
        view.addSubview(grayColorIsSelectedButton)
        view.addSubview(lightGrayColorIsSelectedButton)
        view.addSubview(lightGrayColorButton)
        view.addSubview(grayColorButton)
        view.addSubview(addToBusketButton)
        view.addSubview(orderInfoLabel)
        view.addSubview(boxButton)
        lightGrayColorIsSelectedButton.isHidden = true
        createScrollView()
        createMultiplyColorString()
        gradientColorGray()
        gradientColorLightGray()
        guard let product = product else { return }
        for imageName in product.imageName {
            addNewImageView(imageName: imageName)
        }
    }
    private func createBarButtonItems() {
        let share = UIBarButtonItem(barButtonSystemItem: .action,
                                    target: self,
                                    action: .none)
        let like = UIBarButtonItem(image: UIImage(systemName: "heart"),
                                   style: .plain,
                                   target: .none,
                                   action: .none)
        navigationItem.rightBarButtonItems = [like, share]
    }
    private func createMultiplyColorString() {
        var myMultyMutableString = NSMutableAttributedString()
        var myMutableString = NSMutableAttributedString()
        myMultyMutableString = NSMutableAttributedString(string: Constants.orderInfoLabelText as String)
        myMutableString = NSMutableAttributedString(string: Constants.compatibilityLabelText as String)
        myMultyMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                          value: UIColor.gray,
                                          range: NSRange(location: 50, length: 30))
        myMultyMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                          value: UIColor.systemBlue,
                                          range: NSRange(location: 80, length: 48))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: UIColor.systemBlue,
                                     range: NSRange(location: 12, length: 24))
        orderInfoLabel.attributedText = myMultyMutableString
        compatibilityLabel.attributedText = myMutableString
    }
    private func createScrollView() {
        let scrollViewRect = CGRect(x: 0, y: 170, width: view.bounds.width, height: 200)
        productScrollView = UIScrollView(frame: scrollViewRect)
        productScrollView.isPagingEnabled = true
        productScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3,
                                               height: 200)
        productScrollView.contentMode = .scaleAspectFit
        view.addSubview(productScrollView)
    }
    private func addNewImageView(imageName: String) {
        var imageViewRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: 190)
        imageViewRect.origin.x = imageViewRect.size.width * CGFloat(productScrollView.subviews.count)
        let imageView = newImageViewWithImage(paramImage: imageName, paramFrame: imageViewRect)
        productScrollView.addSubview(imageView)
    }
    private func customNavigationBar(largeType: Bool, color: UIColor) {
        let apperance = UINavigationBarAppearance()
        if largeType == true {
            apperance.configureWithTransparentBackground()
        } else {
            apperance.configureWithOpaqueBackground()
        }
        apperance.backgroundColor = UIColor(named: Color.blackColor)
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance =
        navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.prefersLargeTitles = largeType
    }
    private func newImageViewWithImage(paramImage: String, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: paramImage)
        result.isUserInteractionEnabled = true
        result.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                           action: #selector(
                                                            presentWKViewController)))
        return result
    }
    private func gradientColorGray() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemGray6.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.frame = grayColorButton.bounds
        grayColorButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    private func gradientColorLightGray() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.lightGray.cgColor]
        gradientLayer.frame = lightGrayColorButton.bounds
        lightGrayColorButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    @objc private func lightGrayIsSelectedAction() {
        if lightGrayColorButton.isTouchInside {
            grayColorIsSelectedButton.isHidden = true
            lightGrayColorIsSelectedButton.isHidden = false
        }
    }
    @objc private func grayIsSelectedAction() {
        if grayColorButton.isTouchInside {
            lightGrayColorIsSelectedButton.isHidden = true
            grayColorIsSelectedButton.isHidden = false
        }
    }
    @objc private func presentWKViewController() {
        let restoreWKViewController = WKViewController()
        restoreWKViewController.productURL = product?.link ?? ""
        restoreWKViewController.modalPresentationStyle = .formSheet
        present(restoreWKViewController, animated: true)
    }
}

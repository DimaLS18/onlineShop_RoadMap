//
//  ProductViewController.swift
//  StoreProject_RoadMap
//
//  Created by Dima Kovrigin on 07.10.2022.
//

import UIKit
/// Экран со сведениями о продукте
final class ProductViewController: UIViewController {
    private enum Constants {
        static let with = "Совместимо с"
        static let blackButtonImage = "blackButtonImage"
        static let grayButtonImage = "grayButtonImage"
        static let today = "Заказ сегодня в течение дня, доставка:"
        static let forFree = "Чт 25 Фев - бесплатно"
        static let geo = "Варианты доставки для местоположения: 142500"
        static let checkMark = "checkmark.circle.fill"
        static let box = "shippingbox"
        static let macBook = "MacBook Pro - Дмитрий"
        static let basketButton = "Добавить в корзину"
        static let price = "3 990.00 руб."
        static let images = ["4", "2", "case2"]
        static let gray = "searchaColor"
        static let textColor = "mainTextColor"
        static let viewBack = "viewBackColor"
    }

    // MARK: - Private Visual Components
    private lazy var myScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        let scrollViewRect = CGRect(x: 0, y: 250, width: view.bounds.width, height: 200)
        scrollView = UIScrollView(frame: scrollViewRect)
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollViewRect.size.width * CGFloat(images.count),
                                        height: scrollViewRect.size.height)
        return scrollView
    }()

    private lazy var withLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 90, y: 560, width: 100, height: 40)
        label.textColor = .gray
        label.text = Constants.with

        return label
    }()

    private lazy var blackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.frame = CGRect(x: 200, y: 500, width: 40, height: 40)

        return button
    }()

    private lazy var grayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: view.bounds.width / 2 - 40, y: 500, width: 40, height: 40)

        return button
    }()

    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 40, y: 700, width: 300, height: 15)
        label.textColor = .white
        label.text = Constants.today

        return label
    }()

    private lazy var forFreeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 40, y: 715, width: 300, height: 15)
        label.textColor = UIColor(named: Constants.gray)
        label.text = Constants.forFree

        return label
    }()

    private lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 40, y: 730, width: 330, height: 15)
        label.textColor = .systemBlue
        label.text = Constants.geo

        return label
    }()

    private lazy var withImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 60, y: 570, width: 20, height: 20)
        imageView.image = UIImage(systemName: Constants.checkMark)
        imageView.tintColor = .systemGreen
        return imageView
    }()

    private lazy var boxImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 5, y: 700, width: 20, height: 20)
        imageView.image = UIImage(systemName: Constants.box)
        imageView.tintColor = .gray
        return imageView
    }()

    private lazy var withMacLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 185, y: 560, width: 150, height: 40)
        label.textColor = .systemBlue
        label.text = Constants.macBook

        return label
    }()

    private lazy var addToBasketButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 5, y: 630, width: view.bounds.width - 10, height: 40)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle(Constants.basketButton, for: .normal)
        button.tintColor = .white

        return button
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.frame = CGRect(x: 155, y: 142, width: 100, height: 30)
        label.textColor = UIColor(named: Constants.gray)
        label.text = Constants.price

        return label
    }()

    // MARK: - Public Properties
    var images = Constants.images
    var productInfo = Constants.macBook

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    // MARK: - Private objc methods
    @objc private func rightHandAction() {

    }

    // MARK: - Private methods
    private func initMethods() {
        configureViews()
        createProductLabel(name: productInfo)
        createInfoProductLabel(name: productInfo)
        addNewImages(images: images)
        settingsView()
    }

    private func addNewImages(images: [String]) {
        for image in images {
            addNewImageView(imageName: image)
        }
    }

    private func configureViews() {
        view.backgroundColor = UIColor(named: Constants.viewBack)
        view.addSubview(grayButton)
        view.addSubview(blackButton)
        view.addSubview(priceLabel)
        view.addSubview(addToBasketButton)
        view.addSubview(withImage)
        view.addSubview(withLabel)
        view.addSubview(withMacLabel)
        view.addSubview(boxImage)
        view.addSubview(todayLabel)
        view.addSubview(forFreeLabel)
        view.addSubview(deliveryLabel)
        view.addSubview(myScrollView)
    }

    private func createProductLabel(name: String) {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.frame = CGRect(x: 5, y: 100, width: 380, height: 50)
        label.textColor = UIColor(named: Constants.textColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = productInfo

        view.addSubview(label)
    }

    private func settingsView() {
        let shareButtonItem = UIBarButtonItem()
        shareButtonItem.image = UIImage(systemName: "square.and.arrow.up")
        let heartButtonItem = UIBarButtonItem()
        heartButtonItem.image = UIImage(systemName: "suit.heart")
        navigationItem.setRightBarButtonItems([heartButtonItem, shareButtonItem], animated: true)
    }

    private func createInfoProductLabel(name: String) {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.frame = CGRect(x: 5, y: 460, width: 380, height: 40)
        label.textColor = UIColor(named: Constants.gray)
        label.textAlignment = .center
        label.text = productInfo

        view.addSubview(label)
    }

    private func addNewImageView(imageName: String) {
        var imageViewRect = CGRect(x: 5, y: 0, width: view.bounds.width, height: 180)

        imageViewRect.origin.x = imageViewRect.size.width * CGFloat(myScrollView.subviews.count)

        let imageView = newImageViewWithImage(paramImage: imageName, paramFrame: imageViewRect)

        myScrollView.addSubview(imageView)
    }

    private func newImageViewWithImage(paramImage: String, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)

        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: paramImage)

        return result
    }
}

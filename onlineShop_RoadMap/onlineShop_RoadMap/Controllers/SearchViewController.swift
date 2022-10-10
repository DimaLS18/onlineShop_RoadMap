//
//  SearchViewController.swift
//  StoreProject_RoadMap
//
//  Created by Dima Kovrigin on 07.10.2022.
//
import UIKit
/// Экран поиска
final class SearchViewController: UIViewController {
    private enum Constants {
        static let search = "Поиск"
        static let magnifyingglass = "magnifyingglass"
        static let blackCase = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let watch = "Спортивный ремешок Black Unity"
        static let brownCase = "Кожаный чехол MacBook Pro, 16 дюймов"
        static let recently = "Недавно просмотренные"
        static let variants = "Варианты запросов"
        static let airpods = "AirPods"
        static let appleCare = "AppleCare"
        static let beats = "Beats"
        static let compare = "Cравнение модели iPhone"
        static let clear = "Очистить"
        static let searchProduct = " Поиск по продуктам и магазинам"
        static let blackImage = "Image"
        static let strapImage = "4"
        static let brownCaseImg = "2"
    }

    // MARK: - Private Visual Components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 5, y: 80, width: 140, height: 75)
        label.textColor = .white
        label.text = Constants.search

        return label
    }()

    private lazy var recentlyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 200, width: 300, height: 75)
        label.textColor = .white
        label.text = Constants.recently

        return label
    }()

    private lazy var variantsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 435, width: 300, height: 75)
        label.textColor = .white
        label.text = Constants.variants

        return label
    }()

    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.clear, for: .normal)
        button.setTitleColor(UIColor(
            red: 4/255, green: 140/255, blue: 224/255, alpha: 1.0
        ), for: .normal)
        button.frame = CGRect(x: 300, y: 203, width: 100, height: 75)

        return button
    }()

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        textField.attributedPlaceholder = NSAttributedString(
            string: Constants.searchProduct,
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
                        ]
        )

        let imageView = UIImageView(image: UIImage(systemName: Constants.magnifyingglass))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        textField.leftView = imageView
        textField.leftViewMode = .always
        textField.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        textField.frame = CGRect(x: 5, y: 150, width: 380, height: 40)
        textField.layer.cornerRadius = 10
        return textField
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()

    }

    // MARK: - Private methods
    @objc private func imageTappedAction(tapGestureRecognizer: UITapGestureRecognizer) {
        switch tapGestureRecognizer.view?.tag {
        case 0:
            productInfo(nameProduct: Constants.blackCase, imageProduct: Constants.blackImage)
        default:
            break
        }
    }

    private func productInfo(nameProduct: String, imageProduct: String) {
        let productVC = ProductViewController()
        productVC.productName = nameProduct
        productVC.productImageName = imageProduct

        navigationController?.pushViewController(productVC, animated: false)
    }

    private func initMethods() {
        setupView()

        createGrayLine(frame: CGRect(x: 5, y: 540, width: 385, height: 1))
        createGrayLine(frame: CGRect(x: 5, y: 590, width: 385, height: 1))
        createGrayLine(frame: CGRect(x: 5, y: 640, width: 385, height: 1))

        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 505, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 555, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 605, width: 23, height: 23))
        createMagnifyingGlassImageView(frame: CGRect(x: 5, y: 655, width: 23, height: 23))

        createProductText(text: Constants.airpods, frame: CGRect(x: 40, y: 490, width: 140, height: 50))
        createProductText(text: Constants.appleCare, frame: CGRect(x: 40, y: 540, width: 140, height: 50))
        createProductText(text: Constants.beats, frame: CGRect(x: 40, y: 590, width: 140, height: 50))
        createProductText(text: Constants.compare, frame: CGRect(x: 40, y: 640, width: 300, height: 50))

        createProduct(text: Constants.blackCase,
                      imageName: Constants.blackImage,
                      frameOfFirstImage: CGRect(x: 20, y: 290, width: 100, height: 75),
                      frameOfSecondImage: CGRect(x: 5, y: 275, width: 130, height: 160),
                      tag: 0, frameOfLabel: CGRect(x: 12, y: 358, width: 120, height: 90)
        )
        createProduct(text: Constants.watch, imageName: Constants.strapImage,
                      frameOfFirstImage: CGRect(x: 178, y: 280, width: 100, height: 90),
                      frameOfSecondImage: CGRect(x: 160, y: 275, width: 130, height: 160),
                      tag: 1, frameOfLabel: CGRect(x: 168, y: 353, width: 120, height: 100)
        )
        createProduct(text: Constants.brownCase,
                      imageName: Constants.brownCaseImg,
                      frameOfFirstImage: CGRect(x: 330, y: 294, width: 100, height: 90),
                      frameOfSecondImage: CGRect(x: 315, y: 275, width: 130, height: 160),
                      tag: 2, frameOfLabel: CGRect(x: 320, y: 353, width: 120, height: 100)
        )
    }

    private func createMagnifyingGlassImageView(frame: CGRect) {
        let imageView = UIImageView(image: UIImage(systemName: Constants.magnifyingglass))
        imageView.tintColor = UIColor(red: 0.5882, green: 0.5882, blue: 0.5882, alpha: 1.0)
        imageView.frame = frame

        view.addSubview(imageView)
    }

    private func createProduct(text: String,
                               imageName: String,
                               frameOfFirstImage: CGRect,
                               frameOfSecondImage: CGRect,
                               tag: Int,
                               frameOfLabel: CGRect
    ) {
        let imageView = UIImageView()
        imageView.frame = frameOfSecondImage
        imageView.tag = tag
        if tag == 0 {
            let tapGestureRecognizer = UITapGestureRecognizer(
                target: self, action: #selector(imageTappedAction(tapGestureRecognizer:))
            )
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)

        }

        imageView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
        imageView.layer.cornerRadius = 10

        let mainImageView = UIImageView(image: UIImage(named: imageName))
        mainImageView.frame = frameOfFirstImage

        let label = UILabel()
        label.frame = frameOfLabel
        label.text = text
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white

        view.addSubview(imageView)
        view.addSubview(mainImageView)
        view.addSubview(label)
    }

    private func createGrayLine(frame: CGRect) {
        let lineView = UIView()
        lineView.frame = frame
        lineView.setUnderLine()

        view.addSubview(lineView)
    }

    private func createProductText(text: String, frame: CGRect) {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.frame = frame
        label.textColor = .white
        label.text = text

        view.addSubview(label)
    }

    private func setupView() {
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(recentlyLabel)
        view.addSubview(clearButton)
        view.addSubview(variantsLabel)

        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
}
 // Extension UIView
extension UIView {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width - 10,
                              height: self.frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}

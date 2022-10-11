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
        static let blackImageName = "Image"
        static let strapImage = "4"
        static let brownCaseImg = "2"
        static let blackCaseImageTwo = "case2"
        static let blackCaseImageThree = "case3"
        static let brownCaseImgTwo = "caseBrown2"
        static let brownCaseImgThree = "caseBrown3"
        static let strapImgTwo = "clock2"
        static let iphoneImg = "iphone14_pro"
        static let iphoneInfo = "iPhone 14 Pro 256 GB фиолетовый"
        static let backButtonItem = "Поиск"
        static let viewBacgroundColor = "viewBacgroundColor"
        static let textColor = "textColor"
    }
    // MARK: - Private Visual Components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 5, y: 80, width: 140, height: 75)
        label.textColor = UIColor(named: Constants.textColor)
        label.text = Constants.search

        return label
    }()

    private lazy var recentlyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 200, width: 300, height: 75)
        label.textColor = UIColor(named: Constants.textColor)
        label.text = Constants.recently

        return label
    }()

    private lazy var variantsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 5, y: 435, width: 300, height: 75)
        label.textColor = UIColor(named: Constants.textColor)
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

    private lazy var scrollView: UIScrollView = {
        var myScrollView = UIScrollView()
        let scrollViewRect = CGRect(x: 0, y: 248, width: view.bounds.width, height: 204)

        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = false
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width + 285,
                                          height: scrollViewRect.size.height)

        return myScrollView
    }()

    private let blackCaseView: UIView = {
        let blackView = UIView()
        blackView.backgroundColor = UIColor( named: Constants.viewBacgroundColor)
        blackView.frame = CGRect(x: 5, y: 5, width: 150, height: 190)
        blackView.layer.cornerRadius = 10
        blackView.tag = 0
        return blackView
    }()
    private let brownCaseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Constants.viewBacgroundColor)
        view.frame = CGRect(x: 345, y: 5, width: 150, height: 190)
        view.layer.cornerRadius = 15
        view.tag = 2
        return view
    }()
    private let phoneCaseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Constants.viewBacgroundColor)
        view.frame = CGRect(x: 515, y: 5, width: 150, height: 190)
        view.layer.cornerRadius = 15
        view.tag = 3
        return view
    }()
    private let watchbandView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Constants.viewBacgroundColor)
        view.frame = CGRect(x: 175, y: 5, width: 150, height: 190)
        view.layer.cornerRadius = 15
        view.tag = 1
        return view
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    // MARK: - Private methods
    @objc private func handleTap(gest: UIGestureRecognizer) {
        let productViewController = ProductViewController()
        switch gest.view?.tag {
        case 0:
            productViewController.images = [
                Constants.blackImageName,
                Constants.blackCaseImageTwo,
                Constants.blackCaseImageThree
            ]
            productViewController.productInfo = Constants.blackCase
        case 1:
            productViewController.images = [
                Constants.strapImage,
                Constants.strapImgTwo
            ]
            productViewController.productInfo = Constants.watch
        case 2:
            productViewController.images = [
                Constants.brownCaseImg,
                Constants.brownCaseImgTwo,
                Constants.brownCaseImgThree
            ]
            productViewController.productInfo = Constants.brownCase
        case 3:
            productViewController.images = [
                Constants.iphoneImg
            ]
            productViewController.productInfo = Constants.iphoneInfo
        default:
            break
        }
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = Constants.backButtonItem
        navigationItem.backBarButtonItem = backButtonItem
        navigationController?.pushViewController(productViewController, animated: false)
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
                      imageName: Constants.blackImageName,
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 0, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: blackCaseView
        )
        createProduct(text: Constants.watch,
                      imageName: Constants.strapImage,
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 1, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: watchbandView
        )
        createProduct(text: Constants.brownCase,
                      imageName: Constants.brownCaseImg,
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 2, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: brownCaseView
        )
        createProduct(text: Constants.iphoneInfo,
                      imageName: Constants.iphoneImg,
                      frameOfSecondImage: CGRect(x: 23, y: 30, width: 100, height: 100),
                      tag: 3, frameOfLabel: CGRect(x: 13, y: 120, width: 130, height: 80),
                      newView: phoneCaseView
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
                               frameOfSecondImage: CGRect,
                               tag: Int,
                               frameOfLabel: CGRect,
                               newView: UIView
    ) {
        let imageView = UIImageView()
        let productImage = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.image = productImage
        imageView.frame = frameOfSecondImage
        imageView.tag = tag
        let label = UILabel()
        label.frame = frameOfLabel
        label.text = text
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white
        newView.addSubview(label)
        newView.addSubview(imageView)
        newView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        view.addSubview(newView)
        scrollView.addSubview(newView)
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
        view.addSubview(scrollView)
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

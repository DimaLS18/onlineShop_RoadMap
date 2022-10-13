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
        static let searchLabelText = "Поиск"
        static let searchTextFieldPlaceholderText = "Поиск по продуктам и магазинам"
        static let recentlyViewedLabelText = "Недавно просмотренные"
        static let cleanButtonTitleText = "Очистить"
        static let requestOptionsLabelText = "Варианты запросов"
        static let blackCaseLabelText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let watchbandLabelText = "Спортивный ремешок Black Unity"
        static let brownCaseLabelText = "Кожаный чехол для MacBook Pro 16 дюймов, коричневый"
        static let iPhoneCaseLabelText = "Iphone 14 pro фиолетовый цыет"
        static let airPodsLabelText = "AirPods"
        static let appleCareLabelText = "AppleCare"
        static let beatsLabelText = "Beats"
        static let iphoneLabelText = "Сравнение модели iPhone"
        static let blackCasePrice = "3 990.00 руб"
        static let brownCasePrice = "4 990.00 руб"
        static let watchbandPrice = "1 200.00 руб"
        static let iPhonePrice = "89 900.00 руб"
    }
    // MARK: - Visual Component
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.searchLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 20, y: 100, width: 90, height: 50)
        return label
    }()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.searchTextFieldPlaceholderText
        searchBar.frame = CGRect(x: 10, y: 150, width: 380, height: 30)
        return searchBar
    }()

    private let recentlyViewedLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recentlyViewedLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        return label
    }()

    private let cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.cleanButtonTitleText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 280, y: 211, width: 90, height: 30)
        return button
    }()

    private lazy var productScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(named: Color.blackColor)
        scrollView.frame = CGRect(x: 0, y: 250, width: self.view.bounds.width, height: 210)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 210)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let requestOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestOptionsLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 20, y: 470, width: 300, height: 50)
        return label
    }()

    private let airPodsSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.frame = CGRect(x: 20, y: 520, width: 350, height: 50)
        return view
    }()

    private let airPodsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.airPodsLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()

    private let glassForAirPodsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .systemGray
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()

    private let appleCareSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.blackColor)
        view.frame = CGRect(x: 20, y: 570, width: 350, height: 50)
        return view
    }()

    private let appleCareLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.appleCareLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()

    private let glassForAppleCareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()

    private let beatsSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.blackColor)
        view.frame = CGRect(x: 20, y: 620, width: 350, height: 50)
        return view
    }()

    private let beatsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.beatsLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()

    private let glassBeatsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()

    private let iPhoneSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.blackColor)
        view.frame = CGRect(x: 20, y: 670, width: 350, height: 50)
        return view
    }()

    private let iPhoneLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.iphoneLabelText
        label.textColor = UIColor(named: Color.textColor)
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()

    private let glassIPhoneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()

    // MARK: - Private property

    var products = [Product(name: "Чехол Incase Flat для MacBook Pro 16 дюймов",
                            imageName: ["caseBlack", "caseBlack2", "caseBlack3"],
                            price: "3 990.00 руб",
                            link: "https://re-store.ru/catalog/INMB100649-BLK/"),
                    Product(name: "Кожаный чехол для MacBook Pro 16 дюймов, коричневый",
                            imageName: ["caseBrown", "caseBrown2", "caseBrown3"],
                            price: "4 990.00 руб",
                            link: "https://re-store.ru/catalog/PA15SASA5450/"),
                    Product(name: "Спортивный ремешок Black Unity",
                            imageName: ["clock", "clock1"],
                            price: "1 200.00 руб",
                            link: "https://re-store.ru/catalog/MJ4W3ZM-A/" ),
                    Product(name: "Iphone 14 pro ",
                            imageName: ["iphone14_pro", "iphone14_pro1", "iphone14_pro2"],
                            price: "99 900.00 руб",
                            link: "https://re-store.ru/catalog/10114MAX256PPLE/") ]

    private var viewFrame = 10
    private var tag = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    // MARK: - Private method

    private func setupView() {
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(recentlyViewedLabel)
        view.addSubview(cleanButton)
        view.addSubview(requestOptionsLabel)
        view.addSubview(airPodsSearchView)
        createAirPodsSearchView()
        view.addSubview(appleCareSearchView)
        createAppleCareSearchView()
        view.addSubview(beatsSearchView)
        createBeatsSearchView()
        view.addSubview(iPhoneSearchView)
        createIPhoneSearchView()
        createScrollView()
        addView()

        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func createScrollView() {
        let scrolViewRect = CGRect(x: 0, y: 240, width: view.bounds.width + 300, height: 210)
        productScrollView.contentSize = CGSize(width: scrolViewRect.size.width, height: 200)
        productScrollView.contentMode = .scaleAspectFit
        view.addSubview(productScrollView)
    }

    private func createProductView(name: String, imageName: String, tag: Int ) {
        let productView = UIView()
        productView.backgroundColor = UIColor(named: Color.viewBacgrounColor)
        productView.frame = CGRect(x: viewFrame, y: 0, width: 150, height: 200)
        productView.layer.cornerRadius = 15

        let label = UILabel()
        label.text = name
        label.textColor = UIColor(named: Color.textColor)
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)

        let productImageView = UIImageView()
        let productImage = UIImage(named: imageName)
        productImageView.contentMode = .scaleAspectFit
        productImageView.image = productImage
        productImageView.frame = CGRect(x: 23, y: 30, width: 100, height: 100)

        productView.addSubview(productImageView)
        productView.addSubview(label)
        productView.tag = tag
        productView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        viewFrame += 175
        productScrollView.addSubview(productView)
    }

    private func addView() {
        for item in products {
            createProductView(name: item.name, imageName: item.imageName.first ?? "", tag: tag)
            tag += 1
        }
    }

    private func createAirPodsSearchView() {
        airPodsSearchView.addSubview(airPodsLabel)
        airPodsSearchView.addSubview(glassForAirPodsButton)
    }

    private func createAppleCareSearchView() {
        appleCareSearchView.addSubview(appleCareLabel)
        appleCareSearchView.addSubview(glassForAppleCareButton)
    }

    private func createBeatsSearchView() {
        beatsSearchView.addSubview(beatsLabel)
        beatsSearchView.addSubview(glassBeatsButton)
    }

    private func createIPhoneSearchView() {
        iPhoneSearchView.addSubview(iPhoneLabel)
        iPhoneSearchView.addSubview(glassIPhoneButton)
    }

    @objc private func handleTap(param: UIGestureRecognizer) {
        let productViewController = ProductViewController()
        guard let tag = param.view?.tag else { return }
        productViewController.product = products[tag]

        navigationController?.pushViewController(productViewController, animated: true)
    }
}

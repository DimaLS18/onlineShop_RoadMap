//
//  ProductViewController.swift
//  StoreProject_RoadMap
//
//  Created by Dima Kovrigin on 07.10.2022.
//

import UIKit
/// экран выбранного товара
final class ProductViewController: UIViewController {
    // MARK: - Private Visual Components
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.frame = CGRect(x: 50, y: 400, width: 300, height: 300)
        label.numberOfLines = 0
        return label
    }()
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 120, y: 125, width: 150, height: 150)
        return imageView
    }()
    // MARK: Public Properties
    var productImageName: String?
    var productName: String?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMethods()
    }
    // MARK: - Private Methods
    private func initMethods() {
        setupView()
    }
    private func setupView() {
        productLabel.text = productName ?? "nil"
        productImageView.image = UIImage(named: productImageName ?? "2")
        view.addSubview(productImageView)
        view.addSubview(productLabel)
        view.backgroundColor = .gray
    }
}

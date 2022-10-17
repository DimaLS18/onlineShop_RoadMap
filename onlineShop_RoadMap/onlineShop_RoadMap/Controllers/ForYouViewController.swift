//
//  ForYouViewController.swift
//  StoreProject_RoadMap
//
//  Created by Dima Kovrigin on 07.10.2022.
//

import UIKit
/// экран  избранных товаров для пользователя
final class ForYouViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let forYouTitleText = "Для вас"
        static let newLabelText = "Вот что нового"
        static let recomendText = "Рекомендуется вам"
        static let yourDeviceText = "ваши устройства"
        static let newsLabelText = "Получайте новости о своем заказе в режиме реального времени."
        static let notificationLabelText = "Включите уведомления, чтобы получать новости о своем заказе."
        static let processedText = ["Обрабатывается", "Отправлено", "Доставлено"]
        static let sendText = "Отправлено"
        static let deliveredText = "Доставлено"
        static let orderText = "Ваш заказ отправлен."
        static let descriptionText = "1 товар, доставка завтра"
        static let buttonTitleText = "Показать все"
        static let addBadgeImage = "app.badge"
        static let airPodsImage = "apple-airpod"
        static let chevronImage = "chevron.right"
        static let whiteBarColor = "whiteBarColor"
        static let darkColor = "darkgrayColor"
        static let lineColor = "Color"
        static let keyImageName = "imageData"
    }
    // MARK: - Visual Components
    private lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 20, width: view.bounds.width, height: 30)
        label.text = Constants.newLabelText
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        return label
    }()

    private lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height + 100)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private let continerView: UIView = {
        let myView = UIView()
        myView.frame = CGRect(x: 15, y: 90, width: 360, height: 160)
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 15
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowRadius = 10
        myView.layer.shadowOffset = .init(width: 2, height: 2)
        myView.layer.shadowOpacity = 0.6
        return myView
    }()

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 15, y: 20, width: 60, height: 60)
        imageView.image = UIImage(named: Constants.airPodsImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let orderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 18, width: 250, height: 30)
        label.text = Constants.orderText
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    private let deliveredLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 43, width: 250, height: 30)
        label.text = Constants.descriptionText
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    private lazy var recommendYouLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 330, width: view.bounds.width, height: 30)
        label.text = Constants.recomendText
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let yourDeviceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 555, width: 300, height: 30)
        label.text = Constants.yourDeviceText
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        return label
    }()
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 385, width: 220, height: 70)
        label.text = Constants.newsLabelText
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 430, width: 270, height: 70)
        label.text = Constants.notificationLabelText
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    private let badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 25, y: 390, width: 45, height: 45)
        imageView.image = UIImage(systemName: Constants.addBadgeImage)
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let showButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 270, y: 559, width: 110, height: 30)
        button.setTitle(Constants.buttonTitleText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()

    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 365, y: 430, width: 15, height: 15)
        imageView.image = UIImage(systemName: Constants.chevronImage)
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let lineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 500, width: 390, height: 1)
        view.backgroundColor = UIColor(named: Constants.lineColor)
        return view
    }()
    private let lineForContainerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 95, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constants.lineColor)
        return view
    }()
    private let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.frame = CGRect(x: 10, y: 115, width: 340, height: 0)
        progressView.progressViewStyle = .default
        progressView.setProgress(0.5, animated: false)
        progressView.progressTintColor = .systemGreen
        progressView.layer.transform = CATransform3DMakeScale(1, 1.7, 0)
        return progressView
    }()

    private let seporatorTitleView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 0, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constants.lineColor)
        return view
    }()
    private lazy var avatarIButton: UIButton = {
        let rightButton = UIButton()
        rightButton.backgroundColor = .systemOrange
        rightButton.layer.cornerRadius = 20
        rightButton.contentMode = .scaleToFill
        rightButton.clipsToBounds = true
        rightButton.addTarget(self, action: #selector(showPickerControllerAction), for: .touchUpInside)
        return rightButton
    }()
    private let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 315, y: 85, width: 50, height: 50)
        return imageView
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    // MARK: - PrivateMethod
    private func setupView() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(whatsNewLabel)
        myScrollView.addSubview(recommendYouLabel)
        myScrollView.addSubview(yourDeviceLabel)
        myScrollView.addSubview(newsLabel)
        myScrollView.addSubview(badgeImageView)
        myScrollView.addSubview(notificationLabel)
        myScrollView.addSubview(showButton)
        myScrollView.addSubview(chevronImageView)
        myScrollView.addSubview(lineView)
        myScrollView.addSubview(continerView)
        myScrollView.addSubview(seporatorTitleView)

        continerView.addSubview(lineForContainerView)
        continerView.addSubview(deliveredLabel)
        continerView.addSubview(orderLabel)
        continerView.addSubview(productImageView)
        continerView.addSubview(progressView)
        addLabelsOnCintainerView()
        setNavigationConfiguration()
        checkImageView()

    }
    private func addLabelsOnCintainerView() {
        var numberX: CGFloat = 10
        for index in Constants.processedText {
            let firstLabel = createLabels(numberX: numberX, text: index)
            continerView.addSubview(firstLabel)
            numberX += 133
        }
    }
    private func setNavigationConfiguration() {
             view.backgroundColor = .white
             navigationController?.navigationBar.prefersLargeTitles = true
             navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                                 UIColor.black]
             title = Constants.forYouTitleText
             let barButton = UIBarButtonItem()
             barButton.customView = avatarIButton
             navigationItem.rightBarButtonItem = barButton
    }
    private func setUserDefaultsImage(image: Data) {
             let defaults = UserDefaults.standard
        defaults.setValue(image, forKey: Constants.keyImageName)

             }
    private func checkImageView() {
            let defaults = UserDefaults.standard
        guard let image = defaults.data(forKey: Constants.keyImageName) else { return }
              avatarIButton.setImage(UIImage(data: image)?.resizeImage(to: CGSize(width: 40, height: 40)), for: .normal)
              avatarIButton.contentMode = .scaleToFill
          }

          private func createImagePicker() {
             let imagePicker = UIImagePickerController()
             imagePicker.sourceType = .photoLibrary
             imagePicker.allowsEditing = true
              imagePicker.delegate = self
              present(imagePicker, animated: true)
          }

    @objc private func showPickerControllerAction() {
             createImagePicker()
         }
     }

// MARK: - расширение для UIViewController по соданию Лейблов

extension UIViewController {
    func createLabels(numberX: CGFloat, text: String?) -> UILabel {
           let label = UILabel()
           label.frame = CGRect(x: numberX, y: 130, width: 120, height: 15)
           label.text = text
           label.font = .systemFont(ofSize: 12, weight: .bold)
           label.textColor = .black
           return label
       }
   }
 // MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     func imagePickerController(_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
         guard let editingimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                 else { return }
         avatarIButton.contentMode = .scaleToFill
               avatarIButton.setImage(editingimage.resizeImage(to: CGSize(width: 40, height: 40)), for: .normal)
               guard let editingImageData = editingimage.pngData() else { return }
               setUserDefaultsImage(image: editingImageData)
               dismiss(animated: true)
           }
       }

// MARK: - расширение для UIImage, позволяющее задвать размер картинке
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

//
//  ItemDetailViewController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 21.06.22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    var itemRepository: ItemsRepository
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var brandImage: UIImageView!
    var likeButton: UIButton!
    var brandLabel: UILabel!
    var checkOutButton: UIButton!
    var stepper: UIStepper!
    var counter: UILabel!
    var delegate: BrandCellDelegate?
    private(set) var data: Brand!
    
    var brand: Brand!
    
    init(brand: Brand, repository: ItemsRepository) {
        self.itemRepository = repository
        super.init(nibName: nil, bundle: nil)
        self.brand = brand
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commonInit()
        
        stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    func commonInit() {
        initScrollView()
        initContentView()
        initBrandImage()
        initLikeButton()
        initBrandLabel()
        initcheckOutButton()
        initStepper()
        initCounter()
        constructHierarchy()
        activateConstraints()
    }
    
    @objc func stepperPressed(_ sender: UIStepper) {
        counter.text = Int(sender.value).description
    }
    
    @objc func likeButtonTapped() {
        let isFavourite = brand.isFavorite ?? false
        if isFavourite {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        brand.isFavorite?.toggle()
        itemRepository.set(brand: brand)
    }
}

extension ItemDetailViewController {
    func initScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func initContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initBrandImage() {
        brandImage = UIImageView()
        brandImage.image = UIImage(named: brand.image)
        brandImage.translatesAutoresizingMaskIntoConstraints = false
        brandImage.isUserInteractionEnabled = true
    }
    
    func initLikeButton() {
        likeButton = UIButton(type: .system)
        let isFavourite = brand.isFavorite ?? false
        if isFavourite {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        likeButton.tintColor = .white
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.clipsToBounds = true
    }
    
    func initBrandLabel() {
        brandLabel = UILabel()
        brandLabel.text = brand.info
        brandLabel.numberOfLines = 0
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initcheckOutButton() {
        checkOutButton = UIButton()
        checkOutButton.setTitle("CHECKOUT NOW", for: .normal)
        checkOutButton.backgroundColor = .systemOrange
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.layer.cornerRadius = 10
    }
    
    func initStepper() {
        stepper = UIStepper()
        stepper.backgroundColor = .systemBlue
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initCounter() {
        counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.text = Int(stepper.value).description
        counter.textColor = .black
        counter.backgroundColor = .systemBlue
        counter.textAlignment = .center
        counter.layer.cornerRadius = 10
    }
    
    func constructHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(brandImage)
        brandImage.addSubview(likeButton)
        contentView.addSubview(brandLabel)
        view.addSubview(checkOutButton)
        view.addSubview(stepper)
        view.addSubview(counter)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: checkOutButton.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            brandImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            brandImage.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            likeButton.trailingAnchor.constraint(equalTo: brandImage.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: brandImage.bottomAnchor, constant: -10),
            
            brandLabel.topAnchor.constraint(equalTo: brandImage.bottomAnchor, constant: 30),
            brandLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            brandLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            checkOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            checkOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            checkOutButton.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -10),
            checkOutButton.heightAnchor.constraint(equalToConstant: 100),
            
            stepper.topAnchor.constraint(equalTo: checkOutButton.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            counter.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: -10),
            counter.leadingAnchor.constraint(equalTo: checkOutButton.trailingAnchor, constant: 10),
            counter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            counter.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

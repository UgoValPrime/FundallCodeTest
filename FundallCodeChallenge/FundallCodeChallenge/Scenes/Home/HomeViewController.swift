//
//  HomeViewController.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/18/21.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var cardView = UIView()
    var cardImage = UIImageView()
    var scrollView = UIScrollView()
    var eWalletLabel = UILabel()
    var profileImageView = UIImageView()
    var logoutButton = UIButton()
    var totalBalance = UILabel()
    var incomeLable = UILabel()
    var incomeAmtLabel = UILabel()
    var spentLabel = UILabel()
    var spentAmtLabel = UILabel()
    var requestCardButton = UIButton()
    var analyticsButton = UIButton()
    var foodCard = UIView()
    var fuelCard = UIView()
    var cardsView = UIView()
    var cardScrollView = UIScrollView()
    var cardTitle = UILabel()
    var paragraphStyle = NSMutableParagraphStyle()
    var dayLabel = UILabel()
    var transactionView = UIView()
    var transactionView2 = UIView()
    var transactionView3 = UIView()
    var transactionView4 = UIView()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationBar()
        setupScrollView()
        setupCardView()
        setupCardImageView()
        setupEWalletLabel()
        setupProfileImageView()
        setupLogoutButton()
        setupTotalBalanceLabel()
        setupIncomeLabel()
        setupIncomeAmtLabel()
        setupSpentLabel()
        setupSpentAmtLabel()
        setupRequesCardButton()
        setupAnalyticsButton()
        setupFoodCard()
        setupFuelCard()
        setupCardsView()
        setupCardScrollView()
        setupDayLAbel()
        setupTransactionView()
        setupSecondTransactionView()
        setupThirdTransactionView()
        setupforthTransactionView()
        setupStackView()
      
    }
    
    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        }
    
    func setupScrollView() {
    view.addSubview(scrollView)
            scrollView.frame = scrollView.bounds
            scrollView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            scrollView.showsHorizontalScrollIndicator = true
            scrollView.autoresizingMask = .flexibleHeight
            scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 500)
            scrollView.bounces = true
            scrollView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.width.equalTo(view.frame.width)
                make.height.equalTo(view.frame.height).multipliedBy(0.1)
            }
    }
    
    func setupCardView() {
        cardView = UIView()
        scrollView.addSubview(cardView)
        cardView.backgroundColor = UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 20
        cardView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(-95)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
    }
    
    func setupCardImageView() {
        cardImage = UIImageView()
        cardView.addSubview(cardImage)
        cardImage.image = UIImage(named: "cardBackground")
        cardImage.contentMode = .scaleAspectFill
        cardImage.snp.makeConstraints { (make) in
            make.top.equalTo(cardView)
            make.left.equalTo(cardView)
            make.right.equalTo(cardView)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.4)
        }
    }
    
    func setupEWalletLabel() {
        eWalletLabel = UILabel()
        cardView.addSubview(eWalletLabel)
        eWalletLabel.text = "Fundall e-Wallet"
        eWalletLabel.textColor = .white
        eWalletLabel.textAlignment = .center
        eWalletLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
        eWalletLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardView.snp.top).offset(100)
            make.centerX.equalTo(cardView)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.5)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.08)
        }
    }
    
    func setupProfileImageView() {
        profileImageView = UIImageView()
        cardView.addSubview(profileImageView)
        profileImageView.backgroundColor = .white
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(cardView).offset(80)
            make.left.equalTo(eWalletLabel.snp.right)
            make.right.equalTo(cardView.snp.right).offset(-20)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.16)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.12)
        }
    }
    
    func setupLogoutButton() {
        logoutButton = UIButton()
        cardView.addSubview(logoutButton)
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(cardView).offset(95)
            make.left.equalTo(cardView.snp.left).offset(20)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.08)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.09)
        }
    }
    
    func setupTotalBalanceLabel () {
        totalBalance = UILabel()
        cardView.addSubview(totalBalance)
        totalBalance.text =  "₦12,634.37"
        totalBalance.font = UIFont(name: "FoundersGrotesk-Regular", size: 32)
        totalBalance.textAlignment = .center
        totalBalance.snp.makeConstraints { (make) in
            make.top.equalTo(eWalletLabel.snp.bottom).offset(70)
            make.centerX.equalTo(cardView)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.5)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.11)
        }
    }
    
    func setupIncomeLabel () {
        incomeLable = UILabel()
        cardView.addSubview(incomeLable)
        incomeLable.text =  "Income"
        incomeLable.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
        incomeLable.textAlignment = .center
        incomeLable.snp.makeConstraints { (make) in
            make.top.equalTo(totalBalance.snp.bottom).offset(25)
            make.left.equalTo(cardView.snp.left).offset(50)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.3)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.06)
        }
    }
    
    func setupIncomeAmtLabel () {
        incomeAmtLabel = UILabel()
        cardView.addSubview(incomeAmtLabel)
        incomeAmtLabel.text =  "₦12.634.37"
        incomeAmtLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        incomeAmtLabel.textAlignment = .center
        incomeAmtLabel.snp.makeConstraints { (make) in
            make.top.equalTo(incomeLable.snp.bottom).offset(10)
            make.left.equalTo(cardView.snp.left).offset(50)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.4)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.08)
        }
    }
    
    func setupSpentLabel () {
        spentLabel = UILabel()
        cardView.addSubview(spentLabel)
        spentLabel.text =  "Spent"
        spentLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
        spentLabel.textAlignment = .left
        
        spentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(totalBalance.snp.bottom).offset(25)
            make.right.equalTo(cardView.snp.right).offset(-30)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.3)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.06)
        }
    }
    
    func setupSpentAmtLabel () {
        spentAmtLabel = UILabel()
        cardView.addSubview(spentAmtLabel)
        spentAmtLabel.text =  "₦12.634.37"
        spentAmtLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        spentAmtLabel.textAlignment = .center
        spentAmtLabel.snp.makeConstraints { (make) in
            make.top.equalTo(spentLabel.snp.bottom).offset(10)
            make.right.equalTo(cardView.snp.right).offset(-30)
            make.width.equalTo(cardView.snp.width).multipliedBy(0.4)
            make.height.equalTo(cardView.snp.height).multipliedBy(0.08)
        }
    }
    
    func setupRequesCardButton() {
        requestCardButton = UIButton()
        view.addSubview(requestCardButton)
        requestCardButton.layer.cornerRadius = 32
        requestCardButton.backgroundColor = .white
        requestCardButton.setImage(UIImage(named: "requestCard"), for: .normal)
        requestCardButton.isUserInteractionEnabled = true
        let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressRequestCard))
        requestCardButton.addGestureRecognizer(loginLabelTapGesture)
        requestCardButton.snp.makeConstraints { (make) in
            make.top.equalTo(cardView.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(100)
            make.height.width.equalTo(64)
        }
        
        let Label = UILabel()
        view.addSubview(Label)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        Label.attributedText = NSMutableAttributedString(string: "Request Card", attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
        Label.textColor = UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        Label.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        Label.snp.makeConstraints { (make) in
            make.centerX.equalTo(requestCardButton)
            make.top.equalTo(requestCardButton.snp.bottom).offset(10)
        }
    }
    @objc func didPressRequestCard(){
       let vc = YourCardViewController()
       navigationController?.pushViewController(vc, animated: true)
   }
    
    @objc func didPressAnalytics(){
       let vc = YourCardViewController()
       navigationController?.pushViewController(vc, animated: true)
   }
    
    func setupAnalyticsButton() {
        analyticsButton = UIButton()
        view.addSubview(analyticsButton)
        analyticsButton.layer.cornerRadius = 32
        analyticsButton.backgroundColor = .white
        analyticsButton.setImage(UIImage(named: "analytics"), for: .normal)
        analyticsButton.isUserInteractionEnabled = true
        let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressAnalytics))
        analyticsButton.addGestureRecognizer(loginLabelTapGesture)
        analyticsButton.snp.makeConstraints { (make) in
            make.top.equalTo(cardView.snp.bottom).offset(20)
            make.left.equalTo(requestCardButton.snp.right).offset(45)
            make.height.width.equalTo(64)
           
        }
        
        let Label = UILabel()
        view.addSubview(Label)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        Label.attributedText = NSMutableAttributedString(string: "Analytics", attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
        Label.textColor = UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        Label.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        Label.snp.makeConstraints { (make) in
            make.centerX.equalTo(analyticsButton)
            make.top.equalTo(analyticsButton.snp.bottom).offset(10)
        }
    }
    
    func setupFoodCard() {
        foodCard = UIView()
        scrollView.addSubview(foodCard)
        foodCard.backgroundColor =  .white
        foodCard.layer.cornerRadius = 10
        foodCard.snp.makeConstraints { (make) in
            make.top.equalTo(requestCardButton.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        let firstLineView = UIView()
        firstLineView.backgroundColor = .lightGray
        foodCard.addSubview(firstLineView)
        firstLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(foodCard).offset(-45)
            make.height.equalTo(0.5)
            make.left.equalTo(foodCard).offset(20)
            make.right.equalTo(foodCard).offset(-20)
        }
        let foodLabel = UILabel()
        foodCard.addSubview(foodLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        let fullString = NSMutableAttributedString(string: "")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "food")
        image1Attachment.bounds = CGRect(x: 0, y: -10, width: 25, height: 25)
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: "      Lunch & Dinner"))
        foodLabel.attributedText = fullString
        foodLabel.textColor = .black
        foodLabel.textAlignment = .left
        foodLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        foodLabel.snp.makeConstraints { (make) in
            make.left.equalTo(foodCard.snp.left).offset(25)
            make.top.equalTo(foodCard.snp.top).offset(25)
        }
        
        let priceLabel = UILabel()
        foodCard.addSubview(priceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        priceLabel.attributedText = NSAttributedString(string: "$52/day")
        priceLabel.textColor = .black
        priceLabel.textAlignment = .left
        priceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(foodCard.snp.right).offset(-25)
            make.top.equalTo(foodCard.snp.top).offset(33)
        }
        
        let statusView = UIView()
        foodCard.addSubview(statusView)
        statusView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        statusView.layer.cornerRadius = 20
        statusView.snp.makeConstraints { (make) in
            make.top.equalTo(foodLabel.snp.bottom).offset(20)
            make.centerX.equalTo(foodCard)
            make.width.equalTo(foodCard.snp.width).multipliedBy(0.9)
            make.height.equalTo(foodCard.snp.height).multipliedBy(0.2)
        }
        
        let statusSubView = UIView()
        statusView.addSubview(statusSubView)
        statusSubView.backgroundColor = UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        statusSubView.layer.cornerRadius = 20
        statusSubView.snp.makeConstraints { (make) in
            make.top.equalTo(statusView.snp.top)
            make.left.equalTo(statusView)
            make.width.equalTo(statusView.snp.width).multipliedBy(0.5)
            make.height.equalTo(statusView.snp.height)
        }
        let subStatusPriceLabel = UILabel()
        statusView.addSubview(subStatusPriceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        subStatusPriceLabel.attributedText = NSAttributedString(string: "$450")
        subStatusPriceLabel.textColor = .white
        subStatusPriceLabel.textAlignment = .left
        subStatusPriceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        subStatusPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(statusView.snp.left).offset(25)
            make.centerY.equalTo(statusView)
        }
        
        let secondLineView = UIView()
        secondLineView.backgroundColor =  UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        statusView.addSubview(secondLineView)
        secondLineView.snp.makeConstraints { (make) in
            make.centerY.equalTo(statusView)
            make.width.equalTo(2)
            make.height.equalTo(statusView).multipliedBy(1.5)
            make.right.equalTo(foodCard).offset(-100)
        }
        let statusPriceLabel = UILabel()
        statusView.addSubview(statusPriceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        statusPriceLabel.attributedText = NSAttributedString(string: "$900")
        statusPriceLabel.textColor = .lightGray
        statusPriceLabel.textAlignment = .left
        statusPriceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        statusPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(statusView.snp.right).offset(-25)
            make.centerY.equalTo(statusView)
        }
        
        let Label = UILabel()
        foodCard.addSubview(Label)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        let fullString2 = NSMutableAttributedString(string: "")
        let image2Attachment = NSTextAttachment()
        image2Attachment.image = UIImage(named: "checkBox")
        image2Attachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
        let image2String = NSAttributedString(attachment: image2Attachment)
        fullString2.append(image2String)
        fullString2.append(NSAttributedString(string: "   Your food spending is still on track"))
        Label.attributedText = fullString2
        Label.textColor = .lightGray
        Label.textAlignment = .left
        Label.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        Label.snp.makeConstraints { (make) in
            make.left.equalTo(foodCard.snp.left).offset(25)
            make.top.equalTo(firstLineView.snp.bottom).offset(10)
        }
    }
    
    func setupFuelCard() {
        fuelCard = UIView()
        scrollView.addSubview(fuelCard)
        fuelCard.backgroundColor =  .white
        fuelCard.layer.cornerRadius = 10
        fuelCard.snp.makeConstraints { (make) in
            make.top.equalTo(foodCard.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        let firstLineView = UIView()
        firstLineView.backgroundColor = .lightGray
        fuelCard.addSubview(firstLineView)
        firstLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(fuelCard).offset(-45)
            make.height.equalTo(0.5)
            make.left.equalTo(fuelCard).offset(20)
            make.right.equalTo(fuelCard).offset(-20)
        }
        let foodLabel = UILabel()
        fuelCard.addSubview(foodLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        let fullString = NSMutableAttributedString(string: "")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "house")
        image1Attachment.bounds = CGRect(x: 0, y: -10, width: 25, height: 25)
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: "      Car Fuel"))
        foodLabel.attributedText = fullString
        foodLabel.textColor = .black
        foodLabel.textAlignment = .left
        foodLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        foodLabel.snp.makeConstraints { (make) in
            make.left.equalTo(fuelCard.snp.left).offset(25)
            make.top.equalTo(fuelCard.snp.top).offset(25)
        }
        
        let priceLabel = UILabel()
        fuelCard.addSubview(priceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        priceLabel.attributedText = NSAttributedString(string: "$20/day")
        priceLabel.textColor = .black
        priceLabel.textAlignment = .left
        priceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(fuelCard.snp.right).offset(-25)
            make.top.equalTo(fuelCard.snp.top).offset(33)
        }
        
        let statusView = UIView()
        fuelCard.addSubview(statusView)
        statusView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        statusView.layer.cornerRadius = 20
        statusView.snp.makeConstraints { (make) in
            make.top.equalTo(foodLabel.snp.bottom).offset(20)
            make.centerX.equalTo(fuelCard)
            make.width.equalTo(fuelCard.snp.width).multipliedBy(0.9)
            make.height.equalTo(fuelCard.snp.height).multipliedBy(0.2)
        }
        
        let statusSubView = UIView()
        statusView.addSubview(statusSubView)
        statusSubView.backgroundColor = UIColor(red: 0.62, green: 0.651, blue: 0.745, alpha: 1)
        statusSubView.layer.cornerRadius = 20
        statusSubView.snp.makeConstraints { (make) in
            make.top.equalTo(statusView.snp.top)
            make.left.equalTo(statusView)
            make.width.equalTo(statusView.snp.width).multipliedBy(0.65)
            make.height.equalTo(statusView.snp.height)
        }
        let subStatusPriceLabel = UILabel()
        statusView.addSubview(subStatusPriceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        subStatusPriceLabel.attributedText = NSAttributedString(string: "$600")
        subStatusPriceLabel.textColor = .white
        subStatusPriceLabel.textAlignment = .left
        subStatusPriceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        subStatusPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(statusView.snp.left).offset(25)
            make.centerY.equalTo(statusView)
        }
        
        let secondLineView = UIView()
        secondLineView.backgroundColor =  UIColor(red: 0.004, green: 0.412, blue: 0.22, alpha: 1)
        statusView.addSubview(secondLineView)
        secondLineView.snp.makeConstraints { (make) in
            make.centerY.equalTo(statusView)
            make.width.equalTo(2)
            make.height.equalTo(statusView).multipliedBy(1.5)
            make.right.equalTo(fuelCard).offset(-100)
        }
        let statusPriceLabel = UILabel()
        statusView.addSubview(statusPriceLabel)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        statusPriceLabel.attributedText = NSAttributedString(string: "$900")
        statusPriceLabel.textColor = .lightGray
        statusPriceLabel.textAlignment = .left
        statusPriceLabel.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        statusPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(statusView.snp.right).offset(-25)
            make.centerY.equalTo(statusView)
        }
        
        let Label = UILabel()
        fuelCard.addSubview(Label)
        NSMutableParagraphStyle().lineHeightMultiple = 1.1
        let fullString2 = NSMutableAttributedString(string: "")
        let image2Attachment = NSTextAttachment()
        image2Attachment.image = UIImage(named: "checkBox")
        image2Attachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
        let image2String = NSAttributedString(attachment: image2Attachment)
        fullString2.append(image2String)
        fullString2.append(NSAttributedString(string: "   Your food spending is still on track"))
        Label.attributedText = fullString2
        Label.textColor = .lightGray
        Label.textAlignment = .left
        Label.font = UIFont(name: "FoundersGrotesk-Light", size: 14)
        Label.snp.makeConstraints { (make) in
            make.left.equalTo(fuelCard.snp.left).offset(25)
            make.top.equalTo(firstLineView.snp.bottom).offset(10)
        }
    }
    
    func setupCardsView() {
          scrollView.addSubview(cardsView)
          cardsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
          cardsView.backgroundColor = .white
          cardsView.layer.cornerRadius = 20
          cardsView.clipsToBounds = true
          cardsView.snp.makeConstraints { (make) in
              make.top.equalTo(fuelCard.snp.bottom).offset(30)
              make.left.equalTo(view).offset(20)
              make.right.equalTo(view).offset(-20)
            make.height.equalTo(scrollView).multipliedBy(1.5)
              make.bottom.equalTo(scrollView).offset(-10)
          }
          let cardViewIndicator = UIView()
        cardViewIndicator.backgroundColor = .lightGray
          cardsView.addSubview(cardViewIndicator)
          cardViewIndicator.clipsToBounds = true
          cardViewIndicator.layer.cornerRadius = 3
          cardViewIndicator.snp.makeConstraints { (make) in
              make.centerX.equalTo(cardsView)
              make.width.equalTo(view).multipliedBy(0.2)
              make.height.equalTo(6)
              make.top.equalTo(cardsView).offset(20)
          }
          
          cardsView.addSubview(cardTitle)
          paragraphStyle.lineHeightMultiple = 1.1
          cardTitle.attributedText = NSMutableAttributedString(string: "Cards", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
          cardTitle.textColor = .black
          cardTitle.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
          cardTitle.snp.makeConstraints { (make) in
              make.top.equalTo(cardsView).offset(60)
              make.left.equalTo(cardsView).offset(15)
            make.height.equalTo(cardsView.snp.height).multipliedBy(0.05)
          }
          
          let elipses = UILabel()
          cardsView.addSubview(elipses)
          elipses.attributedText = NSMutableAttributedString(string: "• •", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
          elipses.textColor = .black
          elipses.font = UIFont(name: "FoundersGrotesk-Medium", size: 20)
          elipses.snp.makeConstraints { (make) in
              make.top.equalTo(cardViewIndicator).offset(50)
              make.right.equalTo(cardsView).offset(-15)
          }
      }
      
      func setupCardScrollView() {
          cardsView.addSubview(cardScrollView)
          cardScrollView.frame = cardScrollView.bounds
          cardScrollView.showsHorizontalScrollIndicator = false
          cardScrollView.autoresizingMask = .flexibleWidth
          cardScrollView.contentSize = CGSize(width: cardsView.frame.width + 800, height: 100)
          cardScrollView.bounces = true
          cardScrollView.contentOffset = CGPoint(x:0, y:100)
          cardScrollView.snp.makeConstraints { (make) in
              make.top.equalTo(cardTitle.snp.bottom).offset(0)
              make.width.equalTo(cardsView)
              make.height.equalTo(cardsView).multipliedBy(0.35)
          }
          
          let card1 = UIControl()
          cardScrollView.addSubview(card1)
          card1.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
          card1.clipsToBounds = true
          card1.layer.cornerRadius = 12
          card1.snp.makeConstraints { (make) in
              make.centerY.equalTo(cardScrollView)
              make.left.equalTo(cardScrollView).offset(15)
              make.width.equalTo(view).multipliedBy(0.5)
              make.height.equalTo(cardsView).multipliedBy(0.3)
          }

          let card1Text = UILabel()
          card1.addSubview(card1Text)
          card1Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
          card1Text.textColor = .black
          card1Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
          card1Text.snp.makeConstraints { (make) in
              make.top.equalTo(card1).offset(15)
              make.left.equalTo(card1).offset(11)
          }
          
          let card2 = UIControl()
          cardScrollView.addSubview(card2)
          card2.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
          card2.clipsToBounds = true
          card2.layer.cornerRadius = 12
          card2.snp.makeConstraints { (make) in
              make.centerY.equalTo(cardScrollView)
              make.left.equalTo(card1.snp.right).offset(15)
              make.width.equalTo(view).multipliedBy(0.5)
              make.height.equalTo(cardsView).multipliedBy(0.3)
          }

          let card2Text = UILabel()
          card2.addSubview(card2Text)
          card2Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
          card2Text.textColor = .black
          card2Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
          card2Text.snp.makeConstraints { (make) in
              make.top.equalTo(card2).offset(15)
              make.left.equalTo(card2).offset(11)
          }
          
          let card3 = UIControl()
          cardScrollView.addSubview(card3)
          card3.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
          card3.clipsToBounds = true
          card3.layer.cornerRadius = 12
          card3.snp.makeConstraints { (make) in
              make.centerY.equalTo(cardScrollView)
              make.left.equalTo(card2.snp.right).offset(15)
              make.width.equalTo(view).multipliedBy(0.5)
              make.height.equalTo(cardsView).multipliedBy(0.3)
          }
          
          let card3Text = UILabel()
          card3.addSubview(card3Text)
          card3Text.attributedText = NSMutableAttributedString(string: "Fundall Lifestyle Card", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
          card3Text.textColor = .black
          card3Text.font = UIFont(name: "FoundersGrotesk-Medium", size: 10)
          card3Text.snp.makeConstraints { (make) in
              make.top.equalTo(card3).offset(15)
              make.left.equalTo(card3).offset(11)
          }
      }
    
    func setupDayLAbel() {
        dayLabel = UILabel()
        cardsView.addSubview(dayLabel)
        dayLabel.text = "Today"
        dayLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
        dayLabel.textColor = .black
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardScrollView.snp.bottom).offset(10)
            make.left.equalTo(cardsView.snp.left).offset(20)
            make.width.equalTo(cardsView.snp.width).multipliedBy(0.5)
            make.height.equalTo(cardsView.snp.height).multipliedBy(0.1)
        }
        
        let viewAllLabel = UILabel()
        cardsView.addSubview(viewAllLabel)
        viewAllLabel.text = "View all"
        viewAllLabel.textColor =  UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
        viewAllLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
        viewAllLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(dayLabel)
            make.right.equalTo(cardsView.snp.right)
            make.width.equalTo(cardsView.snp.width).multipliedBy(0.3)
            make.height.equalTo(cardsView.snp.height).multipliedBy(0.08)
        }
    }
    
    func setupTransactionView() {
        transactionView = UIView()
        transactionView.backgroundColor = .red
        
        let imageView = UIImageView()
        transactionView.addSubview(imageView)
        transactionView.backgroundColor = .white
        imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .center
        imageView.image = UIImage(named: "plane")
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView)
            make.height.width.equalTo(transactionView.snp.height).multipliedBy(0.8)
            make.left.equalTo(transactionView.snp.left).offset(20)
        }
        
        let nameLabel = UILabel()
        transactionView.addSubview(nameLabel)
        nameLabel.text = "Tobiola"
        nameLabel.textColor =  .black
        nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView).offset(-15)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView.snp.height).multipliedBy(0.25)
        }
        
        let timeLabel = UILabel()
        transactionView.addSubview(timeLabel)
        timeLabel.text = "Just now"
        timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
        timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView).offset(10)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView.snp.height).multipliedBy(0.2)
        }
        
        let priceLabel = UILabel()
        transactionView.addSubview(priceLabel)
        priceLabel.text = "₦130"
        priceLabel.textColor =  .green
        priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.right.equalTo(transactionView.snp.right).offset(-40)
            make.width.equalTo(transactionView.snp.width).multipliedBy(0.15)
            make.height.equalTo(transactionView.snp.height).multipliedBy(0.25)
        }
        
    }
    
    func setupSecondTransactionView() {
        transactionView2 = UIView()
        transactionView2.backgroundColor = .red
        
        let imageView = UIImageView()
        transactionView2.addSubview(imageView)
        transactionView2.backgroundColor = .white
        imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .center
        imageView.image = UIImage(named: "gem")
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView2)
            make.height.width.equalTo(transactionView2.snp.height).multipliedBy(0.8)
            make.left.equalTo(transactionView2.snp.left).offset(20)
        }
        
        let nameLabel = UILabel()
        transactionView2.addSubview(nameLabel)
        nameLabel.text = "Grocery"
        nameLabel.textColor =  .black
        nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView2).offset(-15)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView2.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView2.snp.height).multipliedBy(0.25)
        }
        
        let timeLabel = UILabel()
        transactionView2.addSubview(timeLabel)
        timeLabel.text = "12:00PM"
        timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
        timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView2).offset(10)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView2.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView2.snp.height).multipliedBy(0.2)
        }
        
        let priceLabel = UILabel()
        transactionView2.addSubview(priceLabel)
        priceLabel.text = "₦100"
        priceLabel.textColor =  UIColor(red: 1, green: 0.082, blue: 0.467, alpha: 1)
        priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.right.equalTo(transactionView2.snp.right).offset(-40)
            make.width.equalTo(transactionView2.snp.width).multipliedBy(0.15)
            make.height.equalTo(transactionView2.snp.height).multipliedBy(0.25)
        }
        
    }
    
    func setupThirdTransactionView() {
        transactionView3 = UIView()
        transactionView3.backgroundColor = .red
        
        let imageView = UIImageView()
        transactionView3.addSubview(imageView)
        transactionView3.backgroundColor = .white
        imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .center
        imageView.image = UIImage(named: "gift")
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView3)
            make.height.width.equalTo(transactionView3.snp.height).multipliedBy(0.8)
            make.left.equalTo(transactionView3.snp.left).offset(20)
        }
        
        let nameLabel = UILabel()
        transactionView3.addSubview(nameLabel)
        nameLabel.text = "Shopping"
        nameLabel.textColor =  .black
        nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView3).offset(-15)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView3.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView3.snp.height).multipliedBy(0.25)
        }
        
        let timeLabel = UILabel()
        transactionView3.addSubview(timeLabel)
        timeLabel.text = "8:00AM"
        timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
        timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView3).offset(10)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView3.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView3.snp.height).multipliedBy(0.2)
        }
        
        let priceLabel = UILabel()
        transactionView3.addSubview(priceLabel)
        priceLabel.text = "₦35"
        priceLabel.textColor = UIColor(red: 1, green: 0.082, blue: 0.467, alpha: 1)
        priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.right.equalTo(transactionView3.snp.right).offset(-40)
            make.width.equalTo(transactionView3.snp.width).multipliedBy(0.15)
            make.height.equalTo(transactionView3.snp.height).multipliedBy(0.25)
        }
        
    }
    
    func setupforthTransactionView() {
        transactionView4 = UIView()
        transactionView4.backgroundColor = .red
        
        let imageView = UIImageView()
        transactionView4.addSubview(imageView)
        transactionView4.backgroundColor = .white
        imageView.backgroundColor = #colorLiteral(red: 0.9439884015, green: 0.9439884015, blue: 0.9439884015, alpha: 1)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = UIColor(red: 0.118, green: 0.949, blue: 1, alpha: 1)
        imageView.contentMode = .center
        imageView.image = UIImage(named: "plne")
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView4)
            make.height.width.equalTo(transactionView4.snp.height).multipliedBy(0.8)
            make.left.equalTo(transactionView4.snp.left).offset(20)
        }
        
        let nameLabel = UILabel()
        transactionView4.addSubview(nameLabel)
        nameLabel.text = "Alvare"
        nameLabel.textColor =  .black
        nameLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 17)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView4).offset(-15)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView4.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView4.snp.height).multipliedBy(0.25)
        }
        
        let timeLabel = UILabel()
        transactionView4.addSubview(timeLabel)
        timeLabel.text = "0:00AM"
        timeLabel.textColor =   UIColor(red: 0.765, green: 0.784, blue: 0.847, alpha: 1)
        timeLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 13)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(transactionView4).offset(10)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.width.equalTo(transactionView4.snp.width).multipliedBy(0.3)
            make.height.equalTo(transactionView4.snp.height).multipliedBy(0.2)
        }
        
        let priceLabel = UILabel()
        transactionView4.addSubview(priceLabel)
        priceLabel.text = "₦30"
        priceLabel.textColor =  .green
        priceLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 17)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.right.equalTo(transactionView4.snp.right).offset(-40)
            make.width.equalTo(transactionView4.snp.width).multipliedBy(0.15)
            make.height.equalTo(transactionView4.snp.height).multipliedBy(0.25)
        }
        
    }
    
    
    func setupStackView() {
        stackView = UIStackView()
        cardsView.addSubview(stackView)
        stackView.backgroundColor = .blue
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(transactionView)
        stackView.addArrangedSubview(transactionView2)
        stackView.addArrangedSubview(transactionView3)
        stackView.addArrangedSubview(transactionView4)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(dayLabel.snp.bottom)
            make.width.equalTo(cardsView.snp.width).multipliedBy(0.9)
            make.bottom.equalTo(cardsView.snp.bottom).offset(-60)
            make.centerX.equalTo(cardsView)
        }
    }
}

//
//  LoginViewController.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/17/21.
//

import UIKit
import QuartzCore

protocol PreLogInDisplayLogic {
   func displayResponse(prompt: GetUserDataResponse)
   func displayError(prompt: String)
}

class LoginViewController: UIViewController, PreLogInDisplayLogic {
    
    func displayResponse(prompt: GetUserDataResponse) {
        leftLifestyleLabel.attributedText = NSMutableAttributedString(string: "\(prompt.success.data.firstName)'s", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        createAccountLabel.attributedText = NSMutableAttributedString(string: "Not \(prompt.success.data.firstName)?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
       }
       
       func displayError(prompt: String) {
          presentAlertForError(with: prompt)
       }
    
    var logoImageView = UIImageView()
    var lifestyleView = UIView()
    var switchAccountView = UIView()
    var createAccountView = UIView()
    var leftLifestyleLabel = UILabel()
    var rightLifeStyleLabel = UILabel()
    var switchAccountLabel = UILabel()
    var switchAccountButton = UIButton()
    var createAccountLabel = UILabel()
    var createAccountButton = UIButton()
    var paragraphStyle = NSMutableParagraphStyle()
    var passwordButton = UIButton()
    var biometricButton = UIButton()
    var interactor : PreLogInBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundImage(image: "loginBackground")
        navigationBar()
        setupLogoImage()
        setupLifeStyleView()
        setupupLeftLifeStyleLabel()
        setupuRightLifeStyleLabel()
        setupSwitchAccountView()
        setupLeftSwitchAccountLabel()
        setupRightSwitchAccountLabel()
        setupCreateAccountView()
        setupLeftCreateAccountLabel()
        setupRightCreateAccountLabel()
        setupBiometricButton()
        setupPasswordButton()
        setUpDependencies()
        interactor?.getUserData()
    }
    
    func setUpDependencies() {
       let interactor = PreLogInInteractor()
       let worker = PreLogInWorker()
       let presenter = PreLogInPresenter()
       let networkClient = GetUserDataApiClient()
       
       interactor.worker = worker
       interactor.presenter = presenter
       
       worker.networkClient = networkClient
       
       presenter.view = self
       
       self.interactor = interactor
    }
    
    
    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        }
    
    func setupLogoImage() {
        logoImageView = UIImageView()
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named:"logoImage")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(240)
            make.centerX.equalTo(view)
            make.height.width.equalTo(view.snp.height).multipliedBy(0.13)
        }
    }
    
    func setupLifeStyleView() {
        view.addSubview(lifestyleView)
        lifestyleView.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(43)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.60)
            make.height.equalTo(view.snp.height).multipliedBy(0.05)
        }
    }
    func setupupLeftLifeStyleLabel() {
        leftLifestyleLabel = UILabel()
        leftLifestyleLabel.text = "Chimdi's"
        leftLifestyleLabel.textAlignment = .right
        leftLifestyleLabel.font = UIFont(name: "FoundersGrotesk-Bold", size: 32)
        lifestyleView.addSubview(leftLifestyleLabel)
        leftLifestyleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lifestyleView.snp.top)
            make.left.equalTo(lifestyleView.snp.left)
            make.width.equalTo(lifestyleView.snp.width).multipliedBy(0.55)
            make.height.equalTo(lifestyleView.snp.height)
        }
    }
    
    func setupuRightLifeStyleLabel() {
        rightLifeStyleLabel = UILabel()
        rightLifeStyleLabel.text = "lifestyle"
        rightLifeStyleLabel.textAlignment = .center
        rightLifeStyleLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 32)
        lifestyleView.addSubview(rightLifeStyleLabel)
        rightLifeStyleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lifestyleView.snp.top)
            make.right.equalTo(lifestyleView.snp.right)
            make.width.equalTo(lifestyleView.snp.width).multipliedBy(0.45)
            make.height.equalTo(lifestyleView.snp.height)
        }
    }
    
    func setupSwitchAccountView() {
        view.addSubview(switchAccountView)
        switchAccountView.snp.makeConstraints { (make) in
            make.top.equalTo(lifestyleView.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.53)
            make.height.equalTo(view.snp.height).multipliedBy(0.023)
        }
    }
    
    func setupLeftSwitchAccountLabel() {
        switchAccountLabel = UILabel()
        switchAccountLabel.text = "Not Chimdi?"
        switchAccountLabel.textAlignment = .right
        switchAccountLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
        switchAccountView.addSubview(switchAccountLabel)
        switchAccountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(switchAccountView.snp.top)
            make.left.equalTo(switchAccountView.snp.left)
            make.width.equalTo(switchAccountView.snp.width).multipliedBy(0.45)
            make.height.equalTo(switchAccountView.snp.height)
        }
    }
    
    func setupRightSwitchAccountLabel() {
        switchAccountButton = UIButton()
        switchAccountButton.setTitle( "Switch Account", for: .normal)
        switchAccountButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Bold", size: 15)
        switchAccountView.addSubview(switchAccountButton)
        switchAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(switchAccountView.snp.top)
            make.right.equalTo(switchAccountView.snp.right)
            make.width.equalTo(switchAccountView.snp.width).multipliedBy(0.55)
            make.height.equalTo(switchAccountView.snp.height)
        }
    }
    
    func setupCreateAccountView() {
        view.addSubview(createAccountView)
        createAccountView.snp.makeConstraints { (make) in
            make.top.equalTo(switchAccountView.snp.bottom).offset(10)
            make.centerX.equalTo(view).offset(5)
            make.width.equalTo(view.snp.width).multipliedBy(0.47)
            make.height.equalTo(view.snp.height).multipliedBy(0.023)
        }
    }
    func setupLeftCreateAccountLabel() {
        createAccountLabel = UILabel()
        createAccountLabel.text = "New Here?"
        createAccountLabel.textAlignment = .right
        createAccountLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
        createAccountView.addSubview(createAccountLabel)
        createAccountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountView.snp.top)
            make.left.equalTo(createAccountView.snp.left)
            make.width.equalTo(createAccountView.snp.width).multipliedBy(0.40)
            make.height.equalTo(createAccountView.snp.height)
        }
    }
    
    func setupRightCreateAccountLabel() {
        createAccountButton = UIButton()
        createAccountButton.setTitle( "Create Account", for: .normal)
        createAccountButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Bold", size: 15)
        createAccountView.addSubview(createAccountButton)
        createAccountButton.isUserInteractionEnabled = true
        let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressCreateAccount))
        createAccountButton.addGestureRecognizer(loginLabelTapGesture)
        createAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountView.snp.top)
            make.right.equalTo(createAccountView.snp.right)
            make.width.equalTo(createAccountView.snp.width).multipliedBy(0.60)
            make.height.equalTo(createAccountView.snp.height)
        }
    }

        func setupBiometricButton() {
            let biometricLabel = UILabel()
            view.addSubview(biometricLabel)
            NSMutableParagraphStyle().lineHeightMultiple = 1.1
            biometricLabel.attributedText = NSMutableAttributedString(string: "Biometrics", attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
            biometricLabel.textColor = .white
            biometricLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
            
            biometricLabel.snp.makeConstraints { (make) in
                make.right.equalTo(view).offset(-20)
                make.bottomMargin.equalTo(view).offset(-15)
            }

            view.addSubview(biometricButton)
            biometricButton.setImage(UIImage(named: "thumbPrint"), for: .normal)
            biometricButton.layer.cornerRadius = 26.5
            biometricButton.layer.borderWidth = 1
            biometricButton.layer.borderColor = UIColor(red: 0.302, green: 0.91, blue: 0.592, alpha: 1).cgColor
            biometricButton.isUserInteractionEnabled = true
            let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressSignin))
            biometricButton.addGestureRecognizer(loginLabelTapGesture)
            biometricButton.snp.makeConstraints { (make) in
                make.centerX.equalTo(biometricLabel)
                make.height.width.equalTo(53)
                make.bottom.equalTo(biometricLabel.snp.top).offset(-10)
            }
            
        }
        
        func setupPasswordButton() {
            let passwordLabel = UILabel()
            view.addSubview(passwordLabel)
            NSMutableParagraphStyle().lineHeightMultiple = 1.1
            passwordLabel.attributedText = NSMutableAttributedString(string: "Password", attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
            passwordLabel.textColor = .white
            passwordLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 14)
            passwordLabel.snp.makeConstraints { (make) in
                make.left.equalTo(view).offset(20)
                make.bottomMargin.equalTo(view).offset(-15)
            }

            view.addSubview(passwordButton)
            passwordButton.setImage(UIImage(named: "lock"), for: .normal)
            passwordButton.layer.cornerRadius = 26.5
            passwordButton.layer.borderWidth = 1
            passwordButton.layer.borderColor = UIColor(red: 0.302, green: 0.91, blue: 0.592, alpha: 1).cgColor
            passwordButton.isUserInteractionEnabled = true
            let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressLoginWithPassword))
            passwordButton.addGestureRecognizer(loginLabelTapGesture)
            passwordButton.snp.makeConstraints { (make) in
                make.centerX.equalTo(passwordLabel)
                make.height.width.equalTo(53)
                make.bottom.equalTo(passwordLabel.snp.top).offset(-10)
            }
        }
    @objc func didPressLoginWithPassword(){
        let vc = PasswordLoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didPressCreateAccount(){
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didPressSignin(){
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

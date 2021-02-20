//
//  PasswordLoginViewController.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/18/21.
//

import UIKit
import NVActivityIndicatorView
    
protocol LogInDisplayLogic {
   func displayResponse(prompt: LogInResponse)
   func displayError(prompt: String)
}


class PasswordLoginViewController: UIViewController, UITextFieldDelegate, LogInDisplayLogic {
    
    func displayResponse(prompt: LogInResponse) {
         if prompt.success.status == "SUCCESS" {
            preloader.stopAnimating()
            activityLoader.isHidden = true
            let view = UINavigationController(rootViewController: HomeViewController())
            view.modalPresentationStyle = .fullScreen
            present(view, animated: true, completion: nil)
            
            UserDefaults.standard.set(prompt.success.user.accessToken, forKey: "accessToken")
            UserDefaults.standard.set(prompt.success.user.email, forKey: "email")
            UserDefaults.standard.set(prompt.success.user.tokenType, forKey: "tokenType")
            UserDefaults.standard.set(prompt.success.user.firstName, forKey: "firstName")
         }
      }
      
      func displayError(prompt: String) {
         preloader.stopAnimating()
         activityLoader.isHidden = true
         presentAlertForError(with: "Something went wrong. please make sure your login details are correct, and try again.")
      }
    
    var paragraphStyle = NSMutableParagraphStyle()
    var titleLabelView = UIView()
    var profileImageView = UIImageView()
    var userDetailsView = UIView()
    var passwordTextField = UITextField()
    let createAccountView = UIView()
    var createAccountButton = UIButton()
    var loginButton = UIButton()
    var activityLoader = UIView()
    var interactor : LogInBusinessLogic?
    var preloader = NVActivityIndicatorView(frame: .zero, type: .audioEqualizer, color: .systemGreen, padding: .none)

    func setUpDependencies() {
          let interactor = LogInInteractor()
          let worker = LogInWorker()
          let presenter = LogInPresenter()
          let networkClient = LogInApiClient()
          
          interactor.worker = worker
          interactor.presenter = presenter
          
          worker.networkClient = networkClient
          
          presenter.view = self
          
          self.interactor = interactor
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        passwordTextField.enablePasswordToggle()
        navigationBar()
        setupTitleLabel()
        setupProfileImage()
        setupUserDetailsView()
        setupPasswordField()
        setupLoginButton()
        setUpCreateAccountView()
        setupLoader()
        setUpDependencies()
    }
    
    
    func setupLoader() {
          activityLoader = UIView()
          view.addSubview(activityLoader)
          activityLoader.layer.cornerRadius = 10
          activityLoader.addSubview(preloader)
          activityLoader.isHidden = true
          preloader.snp.makeConstraints { (make) in
             make.centerX.equalTo(view)
             make.centerY.equalTo(view)
             make.height.width.equalTo(30)
          }
          activityLoader.snp.makeConstraints { (make) in
             make.height.width.equalTo(51)
             make.center.equalTo(view)
          }
       }
    
    func setupTitleLabel() {
        view.addSubview(titleLabelView)
        titleLabelView.snp.makeConstraints { (make) in
            make.centerX.right.equalTo(view)
            make.top.equalTo(view).offset(120)
            make.height.equalTo(view).multipliedBy(0.08)
        }
        let titleLabel = UILabel()
        titleLabelView.addSubview(titleLabel)
        paragraphStyle.lineHeightMultiple = 1.1
        titleLabel.attributedText = NSMutableAttributedString(string: "Welcome back!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        titleLabel.textColor = .label
        titleLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(titleLabelView)
            make.centerY.equalTo(titleLabelView).offset(-10)
        }
    }
    
    func setupProfileImage() {
        view.addSubview(profileImageView)
        profileImageView.image = UIImage(named: "profile-image")
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .green
        profileImageView.layer.cornerRadius = 50
        profileImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerX.equalTo(view)
            make.top.equalTo(titleLabelView.snp.bottom).offset(20)
        }
    }
    
    func setupUserDetailsView() {
        view.addSubview(userDetailsView)
        userDetailsView.snp.makeConstraints { (make) in
            make.centerX.right.equalTo(view)
            make.top.equalTo(profileImageView.snp.bottom).offset(50)
            make.height.equalTo(view).multipliedBy(0.08)
        }
        
        let titleLabel = UILabel()
        userDetailsView.addSubview(titleLabel)
        paragraphStyle.lineHeightMultiple = 1.1
        titleLabel.attributedText = NSMutableAttributedString(string: "We Miss you \(UserDefaults.standard.object(forKey: "firstName") ?? "")", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        titleLabel.textColor = .label
        titleLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(userDetailsView)
            make.top.equalTo(userDetailsView)
        }
        
        let subTitleLabel = UILabel()
        userDetailsView.addSubview(subTitleLabel)
        subTitleLabel.attributedText = NSMutableAttributedString(string: "\(UserDefaults.standard.object(forKey: "email") ?? "")", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        subTitleLabel.textColor = .label
        subTitleLabel.font = UIFont(name: "FoundersGrotesk-RegularItalic", size: 15)
        subTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(userDetailsView)
            make.bottom.equalTo(userDetailsView)
        }
    }
    
    func setupPasswordField() {
        view.addSubview(passwordTextField)
        passwordTextField.borderStyle = UITextField.BorderStyle.none
        let firstLineView = UIView()
        passwordTextField.addSubview(firstLineView)
        firstLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(passwordTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
        }
        firstLineView.backgroundColor = UIColor(named: "fundallColorOne")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 15.0),forKeyPath: "placeholderLabel.font")
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter your password",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        passwordTextField.snp.makeConstraints { (make) in
            make.width.equalTo(view).multipliedBy(0.7)
            make.centerX.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.08)
            make.top.equalTo(userDetailsView.snp.bottom).offset(20)
        }
    }
    
    func setUpCreateAccountView() {
        view.addSubview(createAccountView)
        createAccountView.snp.makeConstraints { (make) in
            make.height.equalTo(view).multipliedBy(0.03)
            make.width.equalTo(170)
            make.left.equalTo(view).offset(20)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        let newUserTextLabel = UILabel()
        createAccountView.addSubview(newUserTextLabel)
        paragraphStyle.lineHeightMultiple = 1.1
        newUserTextLabel.textAlignment = .right
        newUserTextLabel.attributedText = NSMutableAttributedString(string: "New here? ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        newUserTextLabel.textColor = .systemGray
        newUserTextLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
        newUserTextLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(createAccountView)
            make.left.equalTo(createAccountView)
        }
        view.addSubview(createAccountButton)
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.label, for: .normal)
        createAccountButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Bold", size: 15)
        createAccountButton.contentMode = .scaleAspectFit
        createAccountButton.isUserInteractionEnabled = true
        let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressCreateAccount))
        createAccountButton.addGestureRecognizer(loginLabelTapGesture)
        createAccountButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(createAccountView).offset(6)
            make.right.equalTo(createAccountView)
        }
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Regular", size: 16)
        loginButton.layer.cornerRadius = 5
        loginButton.contentMode = .center
        loginButton.backgroundColor = UIColor(named: "fundallColorOne")
        loginButton.isUserInteractionEnabled = true
        let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressLogin))
        loginButton.addGestureRecognizer(loginLabelTapGesture)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(100)
            make.height.equalTo(35)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
    }
    
    @objc func dismissKeyboard() { view.endEditing(true) }
       
       @objc func didPressLogin() {
          let passwordText = passwordTextField.text
          
          if passwordText?.isEmpty == false {
             if let passwordText = passwordText {
                let logInRequest = LogInRequest(email: "\(UserDefaults.standard.object(forKey: "email") ?? "\(UserDefaults.standard.object(forKey: "registerationEmail") ?? "")")", password: passwordText)
                
                interactor?.logIn(with: logInRequest)
                activityLoader.isHidden = false
                preloader.startAnimating()
             }
          } else {
             presentAlertForError(with: "Input field is empty")
          }
       }
    
    @objc func didPressCreateAccount(){
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    //MARK: - HELPERS
    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelButton))
        cancelButton.tintColor = .label
        cancelButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 11)!], for: UIControl.State.normal)
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
    @objc func handleCancelButton() {
        
    }

}


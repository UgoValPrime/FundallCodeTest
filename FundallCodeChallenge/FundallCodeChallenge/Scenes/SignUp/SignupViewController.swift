//
//  LoginViewController.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/17/21.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    
    var titleLabel = UILabel()
    var miniTitleLabel = UILabel()
    var firstNameTextField = UITextField()
    var lastNameTextField = UITextField()
    var emailTextField = UITextField()
    var phoneNumberTextField = UITextField()
    var passwordTextField = UITextField()
    var nameStackView = UIStackView()
    var registrationStackView = UIStackView()
    var scrollView = UIScrollView()
    var signUpButton = UIButton()
    var fundallColorOne = UIColor(red: 0.298, green: 0.91, blue: 0.584, alpha: 1).cgColor
    var fundallColorOnee = UIColor(red: 0.298, green: 0.91, blue: 0.584, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationBar()
        setupTitleLabel()
        setupMiniTitleLabel()
        setUpScrollView()
        setUpRegistrationStackView()
        setUpSignUpButton()
        setUpExistingMemberButton()
        setUpTermsAndConditionText()
        

    }

    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let newBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftMethod))
        newBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 14) ?? UIFont()], for: .normal)
            self.navigationItem.leftBarButtonItem = newBtn
        let rightBtn = UIBarButtonItem(title: "Benefits", style: .plain, target: self, action: #selector(rightMethod))
        rightBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FoundersGrotesk-Regular", size: 14) ?? UIFont()], for: .normal)

            self.navigationItem.rightBarButtonItem = rightBtn
        }
    
    @objc func leftMethod() {
        
    }
    @objc func rightMethod() {
        
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text =  "Let's get started"
        titleLabel.font = UIFont(name: "FoundersGrotesk-Medium", size: 27)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(124)
            make.height.equalTo(view).multipliedBy(0.05)
            make.width.equalTo(view).multipliedBy(0.6)
            make.left.equalTo(27)
        }
    }
    
    func setupMiniTitleLabel() {
        miniTitleLabel = UILabel()
        view.addSubview(miniTitleLabel)
        miniTitleLabel.text =  "Your first step toward a better financial lifestyle starts here."
        miniTitleLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 11)
        miniTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.height.equalTo(view).multipliedBy(0.02)
            make.width.equalTo(view).multipliedBy(0.75)
            make.left.equalTo(16)
        }
    }
    

    
    func setUpScrollView() {
       view.addSubview(scrollView)
       scrollView.frame = self.view.bounds
       scrollView.autoresizingMask = .flexibleHeight
       scrollView.contentSize = CGSize(width: view.frame.size.width, height: 600)
       scrollView.showsHorizontalScrollIndicator = false
       scrollView.showsVerticalScrollIndicator = false
       scrollView.bounces = true
    
       
       scrollView.snp.makeConstraints { (make) in
        make.top.equalTo(miniTitleLabel.snp.bottom).offset(94)
          make.bottom.equalTo(view)
          make.left.equalTo(view)
          make.right.equalTo(view)
       }
    }
    
    func setUpRegistrationStackView() {
       firstNameTextField = UITextField()
       firstNameTextField.placeholder = "First name"
        firstNameTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
        let firstLineView = UIView()
        firstNameTextField.addSubview(firstLineView)
        firstLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(firstNameTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(firstNameTextField)
            make.right.equalTo(firstNameTextField)
        }
        firstLineView.backgroundColor = fundallColorOnee
        firstNameTextField.setupLeftImage(imageName: "user")

       let lastNameTextField = UITextField()
       lastNameTextField.placeholder = "Last name"
        lastNameTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
        let lastLineView = UIView()
        lastNameTextField.addSubview(lastLineView)
        lastLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(lastNameTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(lastNameTextField)
            make.right.equalTo(lastNameTextField).offset(-10)
        }
        lastLineView.backgroundColor = fundallColorOnee
        lastNameTextField.setupLeftImage(imageName: "user")
        
      
       
       
       nameStackView.addArrangedSubview(firstNameTextField)
       nameStackView.addArrangedSubview(lastNameTextField)
       nameStackView.axis = .horizontal
       nameStackView.distribution = .fillEqually
       nameStackView.spacing = 25
       
       let emailTextField = UITextField()
       emailTextField.placeholder = "Email address"
        emailTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
        let emailLineView = UIView()
        emailTextField.addSubview(emailLineView)
        emailLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(emailTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(emailTextField)
            make.right.equalTo(emailTextField)
        }
        emailLineView.backgroundColor = fundallColorOnee
        emailTextField.setupLeftImage(imageName: "conversation")
       
       
       let phoneNumberTextField = UITextField()
       phoneNumberTextField.placeholder = "Phone number"
        phoneNumberTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
        let phoneLineView = UIView()
        phoneNumberTextField.addSubview(phoneLineView)
        phoneLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(phoneNumberTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(phoneNumberTextField)
            make.right.equalTo(phoneNumberTextField)
        }
        phoneLineView.backgroundColor = fundallColorOnee
        phoneNumberTextField.setupLeftImage(imageName: "phone")
       
       let passwordTextField = UITextField()
       passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setValue(UIFont(name: "FoundersGrotesk-Regular", size: 12.0),forKeyPath: "placeholderLabel.font")
        let passwordLineView = UIView()
        passwordTextField.addSubview(passwordLineView)
        passwordLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(passwordTextField).offset(5)
            make.height.equalTo(1)
            make.left.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField)
        }
        passwordLineView.backgroundColor = fundallColorOnee
        
        passwordTextField.enablePasswordToggle()
        passwordTextField.setupLeftImage(imageName: "key")
       
       let inviteCodeLabel = UILabel()
       inviteCodeLabel.text = "Got an invite code?"
       inviteCodeLabel.textColor = UIColor(red: 0.298, green: 0.91, blue: 0.584, alpha: 1)
       inviteCodeLabel.font = UIFont(name: "FoundersGrotesk-Regular", size: 11)
        
       
       registrationStackView.addArrangedSubview(nameStackView)
       registrationStackView.addArrangedSubview(emailTextField)
       registrationStackView.addArrangedSubview(phoneNumberTextField)
       registrationStackView.addArrangedSubview(passwordTextField)
       registrationStackView.addArrangedSubview(inviteCodeLabel)
       scrollView.addSubview(registrationStackView)
       registrationStackView.axis = .vertical
       registrationStackView.distribution = .equalSpacing
       registrationStackView.spacing = 40
       registrationStackView.snp.makeConstraints { (make) in
          make.top.equalTo(scrollView)
          make.left.equalTo(view).offset(27)
          make.right.equalTo(view).offset(-27)
       }
       
    }
    
    func setUpSignUpButton() {
       scrollView.addSubview(signUpButton)
       signUpButton.layer.cornerRadius = 3
       signUpButton.backgroundColor = UIColor(named: "fundallColorOne")
       signUpButton.setTitle("signup".uppercased(), for: .normal)
       signUpButton.setTitleColor(.black, for: .normal)
       signUpButton.titleLabel?.font = UIFont(name: "FoundersGrotesk-Regular", size: 15)
       signUpButton.addTarget(self, action: #selector(didPressSignUpBtn), for: .touchUpInside)
       signUpButton.snp.makeConstraints { (make) in
          make.centerX.equalTo(scrollView)
          make.width.equalTo(198)
          make.height.equalTo(32)
          make.top.equalTo(registrationStackView.snp.bottom).offset(32)
       }
    }
    
    func setUpExistingMemberButton() {
       let label = UILabel()
       let button = UILabel()
       scrollView.addSubview(label)
       scrollView.addSubview(button)
       
       label.text = "Already a member?"
       label.font = UIFont(name: "FoundersGrotesk-Light", size: 12)
       
       button.text = "Log In"
       button.font = UIFont(name: "FoundersGrotesk-Medium", size: 12)
       button.isUserInteractionEnabled = true
       
       let loginLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressLogin))
       button.addGestureRecognizer(loginLabelTapGesture)
       
       label.snp.makeConstraints { (make) in
          make.centerX.equalTo(scrollView).offset(-15)
          make.top.equalTo(signUpButton.snp.bottom).offset(20)
       }
       
       button.snp.makeConstraints { (make) in
          make.centerX.equalTo(scrollView).offset(47)
          make.top.equalTo(signUpButton.snp.bottom).offset(20)
       }
       
       
    }
    @objc func didPressSignUpBtn() {
       let firstNameText = firstNameTextField.text
       let lastNameText = lastNameTextField.text
       let emailAddressText = emailTextField.text
       let phoneNumberText = phoneNumberTextField.text
       let passwordText = passwordTextField.text
       
       if (firstNameText?.isEmpty == false && lastNameText?.isEmpty == false && emailAddressText?.isEmpty == false && phoneNumberText?.isEmpty == false && phoneNumberText?.isEmpty == false && passwordText?.isEmpty == false) {
          if emailAddressText?.isValidEmail ?? false {
             
             //create the account
//             if let firstNameText = firstNameText, let lastNameText = lastNameText, let emailAddressText = emailAddressText, let passwordText = passwordText {
//                let signUpRequest = SignUpRequest(firstName: firstNameText, lastName: lastNameText, email: emailAddressText, password: passwordText, confirmPassword: passwordText)
//
//                interactor?.signUp(with: signUpRequest)
//                activityLoader.isHidden = false
//                preloader.startAnimating()
//             }
             
          } else {
             presentAlertForError(with: "Please make sure the email address provided is valid.")
          }
       } else if (firstNameText?.isEmpty == true && lastNameText?.isEmpty == false && emailAddressText?.isEmpty == false && phoneNumberText?.isEmpty == false && passwordText?.isEmpty == false) ||
                   (firstNameText?.isEmpty == false && lastNameText?.isEmpty == true && emailAddressText?.isEmpty == false && phoneNumberText?.isEmpty == false && passwordText?.isEmpty == false) ||
                   (firstNameText?.isEmpty == false && lastNameText?.isEmpty == false && emailAddressText?.isEmpty == true && phoneNumberText?.isEmpty == false && passwordText?.isEmpty == false) ||
                   (firstNameText?.isEmpty == false && lastNameText?.isEmpty == false && emailAddressText?.isEmpty == false && phoneNumberText?.isEmpty == true && passwordText?.isEmpty == false) ||
                   (firstNameText?.isEmpty == false && lastNameText?.isEmpty == false && emailAddressText?.isEmpty == false && phoneNumberText?.isEmpty == false && passwordText?.isEmpty == true)
       {
          presentAlertForError(with: "Some fields are still empty, please check again.")
          
       } else {
          presentAlertForError(with: "Input fields are empty")
       }
    }
    @objc func didPressLogin() {
      let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpTermsAndConditionText() {
       let label = UILabel()
       scrollView.addSubview(label)
       
       let strNumber: NSString = "By clicking on Sign up, you agree to our terms & conditions and privacy policy." as NSString
       let rangeOne = (strNumber).range(of: "terms & conditions")
       let rangeTwo = (strNumber).range(of: "privacy policy.")
       let attribute = NSMutableAttributedString.init(string: strNumber as String)
       
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: fundallColorOne, range: rangeOne)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: fundallColorOne, range: rangeTwo)
        label.attributedText = attribute
        label.font = UIFont(name: "FoundersGrotesk-Regular", size: 10)
       
       
       label.snp.makeConstraints { (make) in
          make.centerX.equalTo(scrollView)
          make.top.equalTo(signUpButton.snp.bottom).offset(200)
       }
    }
}




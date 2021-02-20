//
//  MainNavViewController.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//

import UIKit

class MainNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let accessToken = UserDefaults.standard.object(forKey: "accessToken")
              let email = UserDefaults.standard.object(forKey: "email")
              let tokenType = UserDefaults.standard.object(forKey: "tokenType")
              let firstName = UserDefaults.standard.object(forKey: "firstName")
              
              if (accessToken == nil) {
                 viewControllers = [ SignupViewController() ]
              } else {
                 viewControllers = [ LoginViewController() ]
              }
    }
}

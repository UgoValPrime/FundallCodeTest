//
//  SignupPresenter.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//

import Foundation

protocol SignUpPresentationLogic {
   func presentResponse(prompt: SignUpResponse)
   func presentError(prompt: String)
}

class SignUpPresenter: SignUpPresentationLogic {
   
   var view: SignUpDisplayLogic?
   
   func presentResponse(prompt: SignUpResponse) {
      view?.displayResponse(prompt: prompt)
   }
   
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
}

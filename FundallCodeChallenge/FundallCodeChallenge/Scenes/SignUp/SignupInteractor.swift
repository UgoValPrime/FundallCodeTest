//
//  SignupInteractor.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//

import Foundation
protocol SignUpBusinessLogic {
   func signUp(with model: SignUpRequest)
}

class SignupInteractor: SignUpBusinessLogic {
   
   var worker: SignUp?
   var presenter: SignUpPresentationLogic?
   
   
   func signUp(with model: SignUpRequest) {
      worker?.signUp(with: model, success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
}

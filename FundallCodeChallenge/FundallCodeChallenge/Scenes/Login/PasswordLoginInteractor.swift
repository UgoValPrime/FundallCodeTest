//
//  PasswordLoginInteractor.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/20/21.
//

import Foundation


protocol LogInBusinessLogic {
   func logIn(with model: LogInRequest)
}
class LogInInteractor: LogInBusinessLogic {
   
   var worker: LogIn?
   var presenter: LogInPresentationLogic?
   
   func logIn(with model: LogInRequest) {
      worker?.logIn(with: model, success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
}

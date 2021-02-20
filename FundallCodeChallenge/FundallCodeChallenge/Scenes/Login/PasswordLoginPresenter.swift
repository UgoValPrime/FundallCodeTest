//
//  PasswordLoginPresenter.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/20/21.
//

import Foundation


protocol LogInPresentationLogic {
   func presentResponse(prompt: LogInResponse)
   func presentError(prompt: String)
}
class LogInPresenter: LogInPresentationLogic {
   
   var view: LogInDisplayLogic?
   
   func presentResponse(prompt: LogInResponse) {
      view?.displayResponse(prompt: prompt)
   }
   
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
   
}

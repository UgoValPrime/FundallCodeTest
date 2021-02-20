//
//  LoginPresenter.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/20/21.
//

import Foundation

protocol PreLogInPresentationLogic {

   func presentResponse(prompt: GetUserDataResponse)

   func presentError(prompt: String)
}
class PreLogInPresenter: PreLogInPresentationLogic {

   var view: PreLogInDisplayLogic?

   func presentResponse(prompt: GetUserDataResponse) {
      view?.displayResponse(prompt: prompt)
   }
    
   func presentError(prompt: String) {
      view?.displayError(prompt: prompt)
   }
}

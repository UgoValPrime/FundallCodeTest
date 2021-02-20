//
//  LoginInteractor.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/20/21.
//

import Foundation


protocol PreLogInBusinessLogic {
   func getUserData()
}
class PreLogInInteractor: PreLogInBusinessLogic {
   
   var worker: GetUserData?
   var presenter: PreLogInPresentationLogic?
   func getUserData() {
      worker?.getUserData(success: { [ weak self ] (response) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentResponse(prompt: response)
      }, failure: { [ weak self ] (error) in
         guard let strongSelf = self else { return }
         strongSelf.presenter?.presentError(prompt: error)
      })
   }
   
}

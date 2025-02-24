//
//  SignupWorker.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//

import Foundation

protocol SignUp {
   func signUp(with model: SignUpRequest, success: @escaping (SignUpResponse) -> Void, failure: @escaping (String) -> Void)
}

class SignUpWorker: SignUp {
   
   var networkClient: SignUpApiClient?
   
   func signUp(with model: SignUpRequest, success: @escaping (SignUpResponse) -> Void, failure: @escaping (String) -> Void) {
      networkClient?.execute(requestType: .post, url: "https://campaign.fundall.io/api/v1/register", params: [ "firstname" : model.firstName, "lastname" : model.lastName, "email" : model.email, "password" : model.password, "password_confirmation" : model.confirmPassword ]) {(response: SignUpResponse) in
         success(response)
     } failure: { (error) in
         failure(error)
     }
   }
   
   
}

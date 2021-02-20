//
//  SignupModel.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//

import Foundation

struct SignUpRequest: Codable {
   let firstName, lastName, email, password, confirmPassword: String
   
   private enum CodingKeys: String, CodingKey {
      case firstName = "firstname", lastName = "lastname", email, password, confirmPassword = "password_confirmation"
   }
}

struct SignUpResponse: Codable {
   let success: Success
   
}

struct Success: Codable {
   let message, status: String
}

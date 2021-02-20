//
//  LoginWorker.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/20/21.
//

import Foundation


protocol GetUserData {
   func getUserData(success: @escaping (GetUserDataResponse) -> Void, failure: @escaping (String) -> Void)
}

class PreLogInWorker: GetUserData {
   
   var networkClient: GetUserDataApiClient?
   
   func getUserData(success: @escaping (GetUserDataResponse) -> Void, failure: @escaping (String) -> Void) {
      networkClient?.execute(headers: [ "Authorization" : "Bearer \(UserDefaults.standard.object(forKey: "accessToken") ?? "")"], url: "https://campaign.fundall.io/api/v1/base/profile", success: { (response) in
         success(response)
      }, failure: { (error) in
         failure(error)
      })
   }
}

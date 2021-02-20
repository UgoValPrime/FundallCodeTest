//
//  ApiClient.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/19/21.
//
import Foundation
import Alamofire

class SignUpApiClient {
   enum HttpMethodType: String {
      case get, post, patch, delete, put
   }
   
   func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
      let changedHttpMethod = httpMethodConversion(httpMethod: requestType)
      AF.request(url, method: changedHttpMethod, parameters: params, encoding:
                  JSONEncoding.default).responseDecodable(of: DataModel.self) { response in
                     if let error = response.error {
                        failure(error.localizedDescription)
                        return
                     }
                     if let result = response.value {
                        success(result)
                        return
                     }
                  }
   }
   
   // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
   private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
      let requestTypeRawValue = httpMethod.rawValue
      let changedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
      return changedHttpMethod
   }
}


class GetUserDataApiClient {
   enum HttpMethodType: String {
      case get, post, patch, delete, put
   }
   
   func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, headers: HTTPHeaders, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
      let changedHttpMethod = httpMethodConversion(httpMethod: requestType)
      AF.request(url, method: changedHttpMethod, parameters: params, headers: headers).responseDecodable(of: DataModel.self) { response in
         if let error = response.error {
            failure(error.localizedDescription)
            return
         }
         if let result = response.value {
            success(result)
            return
         }
      }
   }
   
   // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
   private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
      let requestTypeRawValue = httpMethod.rawValue
      let changedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
      return changedHttpMethod
   }
}


class LogInApiClient {
   enum HttpMethodType: String {
      case get, post, patch, delete, put
   }
   
   func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
      let changedHttpMethod = httpMethodConversion(httpMethod: requestType)
      AF.request(url, method: changedHttpMethod, parameters: params).responseDecodable(of: DataModel.self) { response in
         if let error = response.error {
            failure(error.localizedDescription)
            return
         }
         if let result = response.value {
            success(result)
            return
         }
      }
   }
   
   // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
   private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
      let requestTypeRawValue = httpMethod.rawValue
      let changedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
      return changedHttpMethod
   }
}

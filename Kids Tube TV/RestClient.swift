//
//  RestClient.swift
//  USJ-R Mobile
//
//  Created by keithics on 10/7/15.
//  Copyright © 2015 Web Ninja Technologies. All rights reserved.
//

import Foundation
import Alamofire



class RestClient {
    
    
    
    class func request(view:UIViewController,method: Alamofire.Method, URLString: URLStringConvertible, parameters: [String : String]? = nil, encoding: ParameterEncoding = .JSON, headers: [String: String]? = nil ,
        onSuccess: JSON -> (),
        onError: (JSON -> ())? = nil,
        onFailure: (Void -> ())? = nil,
        onDone: (Void -> ())? = nil
        
        ) -> Void {
            
            let (request, _) = encoding.encode(NSURLRequest(URL: NSURL(string: URLString.URLString)!), parameters: parameters)
            let mutableURLRequest = request
            
            //print(parameters)
            
            mutableURLRequest.HTTPMethod = method.rawValue
            
            mutableURLRequest.setValue("User-Agent", forHTTPHeaderField: "ios-app")
            mutableURLRequest.setValue("mobile", forHTTPHeaderField: "true")
            
            //        print("requesting")
            //        print(URLString)
            
            Alamofire.request(mutableURLRequest).responseJSON { response in
                
               // print("got response")
                print(response.result.value)
               // print(response.result)
                
                if onDone != nil {
                    onDone!()
                }
                
                if let json = response.result.value {
                    let data = JSON(json)
                    
                    if response.response?.statusCode == 200 {
                        onSuccess(data)
                    }else{
                        if onError != nil {
                            onError!(data)
                        }else{
                          //  ModalPopup.showError(view, message: data["message"].stringValue)
                        }
                        
                    }
                }else{
                    //server error
                    if onFailure != nil {
                        onFailure!()
                    }
                }
            }
            
    }
    
    
    
    
    
}




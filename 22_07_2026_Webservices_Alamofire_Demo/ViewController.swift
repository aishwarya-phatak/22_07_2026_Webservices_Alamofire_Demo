//
//  ViewController.swift
//  22_07_2026_Webservices_Alamofire_Demo
//
//  Created by Vishal Jagtap on 12/10/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var postParameters : [String : Any]?
    var headers : HTTPHeaders?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        parseDataUsingAF()
    }
    
    func parseDataUsingAF(){
        
        postParameters = [
            "data": [
              "name": "Wireless Headphones",
              "price": 59.99,
              "category": "Electronics",
              "in_stock": true
            ]
        ]
        
        headers = [
            "Content-Type": "application/json",
            "x-api-key" : "free_user_3KaWn4ZkTPsjR9pW5hraICpQYzY"
        ]
        
        AF.request(Constants.url!,
                   method: .post,
                   parameters: postParameters,
                   encoding: JSONEncoding.default,
                   headers: headers).response { res in
            print("result : ",res.result)
            print("data : ",res.data!)
            print("error : ",res.error)
            print("response : ",res.response)
            print("request : ",res.request)
        }
    }
}

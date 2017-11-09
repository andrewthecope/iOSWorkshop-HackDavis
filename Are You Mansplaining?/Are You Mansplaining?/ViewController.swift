//
//  ViewController.swift
//  Are You Mansplaining?
//
//  Created by Andrew Cope on 11/8/17.
//  Copyright © 2017 Andrew Cope. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findOutPressed(_ sender: Any) {
        
        if let text = textView.text {
            
            let normalizedText = text.lowercased()
            
            // Determine if mansplaining
//            let isMansplaining = normalizedText.contains("actually")
//
//            if isMansplaining {
//                resultLabel.text = "YES!"
//            } else {
//                resultLabel.text = "YOU'RE GOOD."
//            }
            
            isMansplaining(text:normalizedText)
        }
    }
    
    func isMansplaining(text:String) {
        let url = "http://localhost:3000/test"
//"https://httpbin.org/get"
        Alamofire.request(url, parameters: ["text": text])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response { response in
            
            print(response)
        }
    }
    
}


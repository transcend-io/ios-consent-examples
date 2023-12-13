//
//  View3Controller.swift
//  test
//
//  Created by Girish Jonnavithula on 12/12/23.
//

import UIKit
import Transcend
import WebKit

class View3Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TranscendWebView.transcendAPI.webAppInterface.getRegimes(completionHandler: {result, error in
            if let error = error {
                print("UI Error : \(error)")
            } else {
                print(Array(arrayLiteral: result))
                if(result?.contains("us") == true){
                    // Add logic to create instance of Transcend WebView
                    let actualUIView = TranscendWebView(
                                frame: UIScreen.main.bounds,
                                configuration: WKWebViewConfiguration(),
                                transcendConsentUrl: "https://transcend-cdn.com/cm/a3b53de6-5a46-427a-8fa4-077e4c015f93/airgap.js",
                                didFinishNavigation: nil
                            )
                            
                    // Add the TranscendWebView as a subview
                    self.view.addSubview(actualUIView)
                }
            }
        })
    }
    
}

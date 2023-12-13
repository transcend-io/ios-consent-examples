//
//  ViewController.swift
//  test
//
//  Created by Girish Jonnavithula on 12/12/23.
//

import UIKit
import Transcend
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the SwiftUI View
        let transcendWebView = TranscendWebViewUI(transcendConsentUrl: "https://transcend-cdn.com/cm/a3b53de6-5a46-427a-8fa4-077e4c015f93/airgap.js", isInit: true) { result in
            switch result {
            case .success:
                print("Web view navigation succeeded.")
            case .failure(let error):
                print("Web view navigation failed: \(error.localizedDescription)")
            }
        }
        // Create hosting controller
        let hostingController = UIHostingController(rootView: transcendWebView)
        addChild(hostingController)
        // add hostingController's view as subView
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
    }

    @IBAction func btnTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "View2Controller") as! View2Controller
        self.navigationController?.pushViewController(storyboard, animated: true)
        
    }
    @IBAction func storybtnCLICKED(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "View3Controller") as UIViewController
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}


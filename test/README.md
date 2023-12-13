## Using transcend framework in SWIFT Storyboard application

### Step 1
- In the intial App View Controller, create transcendWebView view and attach it as a subView.
- This create a singleton of transcendWebView that runs in background.

```
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
}    
```

### Step 2
- In the any other View Controller, use the API's and condinally create transcendWebView view and attach it as a subView.


```
import UIKit
import Transcend
import WebKit

class View2Controller: UIViewController {

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
```

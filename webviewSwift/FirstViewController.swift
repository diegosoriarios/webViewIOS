import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ReachabilityTest.isConnectedToNetwork() {
            let myURL = URL(string:"https://admin:admin@ccstore-prod-zdoa.oracleoutsourcing.com")
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }else{
            print("No internet connection available")
            let controller:SecondViewController = self.storyboard!.instantiateViewController(withIdentifier: "NoConnection") as! SecondViewController
            controller.view.frame = self.view.bounds;
            controller.willMove(toParent: self)
            self.view.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
        }
    }
    
    
}

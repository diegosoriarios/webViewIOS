import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
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
            let myHTMLString: String! = "<h1 style=\"text-align: center\">No internet connection available!</h1>"
            webView.loadHTMLString(myHTMLString, baseURL: nil)
        }
    }
    
    
}

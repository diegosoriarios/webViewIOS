import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        /*
         CONFIGURATION
        */
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences = preferences
        webConfiguration.websiteDataStore = WKWebsiteDataStore.default()
        
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ReachabilityTest.isConnectedToNetwork() {
            let myURL = URL(string:"https://www.chinainbox.com.br/")
            let myRequest = URLRequest(url: myURL!)
            
            let contentController = WKUserContentController()
            let js = "javascript: localStorage.setItem('key', 'value')"
            let userScript = WKUserScript(source: js, injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: false)
            contentController.addUserScript(userScript)
            
            webView.load(myRequest)
            
            webView.allowsBackForwardNavigationGestures = true
            
            if webView.canGoBack {
                webView.goBack()
            }
            AppStoreReviewManager().showReviewView(afterMinimumLaunchCount: 3)
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

import UIKit
import WebKit
import PushIOManager

class FirstViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    let myURL = URL(string:"https://www.chinainbox.com.br/")
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func loadView() {
        /*
         CONFIGURATION
        */
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences = preferences
        webConfiguration.userContentController.add(self, name:"interOp")
        webConfiguration.websiteDataStore = WKWebsiteDataStore.default()
         
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if ReachabilityTest.isConnectedToNetwork() {
            //let myURL = URL(string:"https://admin:admin@ccstore-stage-zdoa.oracleoutsourcing.com/home")
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

    func storeCookies() {
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return
        }
        let array = cookies.compactMap { (cookie) -> [HTTPCookiePropertyKey: Any]? in
            cookie.properties
        }
        UserDefaults.standard.set(array, forKey: "cookies")
        UserDefaults.standard.synchronize()
    }
    
    func restoreCookies() {
        guard let cookies = UserDefaults.standard.value(forKey: "cookies") as? [[HTTPCookiePropertyKey: Any]] else {
            return
        }
        cookies.forEach { (cookie) in
            guard let cookie = HTTPCookie.init(properties: cookie) else {
                return
            }
            HTTPCookieStorage.shared.setCookie(cookie)
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let sendDate = message.body as! NSDictionary
        print(sendDate)
        showReview()
        webView!.evaluateJavaScript("rateApp()", completionHandler: nil)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        restoreCookies()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        storeCookies()
    }
}

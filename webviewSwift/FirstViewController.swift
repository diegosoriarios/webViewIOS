import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    
    
    private func setupWebView() {
        
        let contentController = WKUserContentController()
        let userScript = WKUserScript(
            source: "mobileHeader()",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )
        contentController.addUserScript(userScript)
        contentController.add(self as WKScriptMessageHandler, name: "rateAction")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        WKWebViewConfiguration().userContentController = contentController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func loadView() {
        restoreCookies()
        /*
         CONFIGURATION
        */
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences = preferences
        self.setupWebView()
        webConfiguration.websiteDataStore = WKWebsiteDataStore.default()
        
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        /*
        let calendar = Calendar.current
        if(calendar.component(.day, from: Date()) == 15 || calendar.component(.day, from: Date()) == 30) {
            showReview()
        }*/
        
        
        super.viewDidLoad()
        
        if ReachabilityTest.isConnectedToNetwork() {
            //let myURL = URL(string:"https://www.chinainbox.com.br/")
            let myURL = URL(string:"https://admin:admin@ccstore-stage-zdoa.oracleoutsourcing.com/home")
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
            storeCookies()
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
        let cookiesStorage = HTTPCookieStorage.shared
        let userDefaults = UserDefaults.standard
        
        let serverBaseUrl = "http://example.com"
        var cookieDict = [String : AnyObject]()
        
        for cookie in cookiesStorage.cookies(for: NSURL(string: serverBaseUrl)! as URL)! {
            cookieDict[cookie.name] = cookie.properties as AnyObject?
        }
        
        userDefaults.set(cookieDict, forKey: "cookiesKey")
    }
    
    func restoreCookies() {
        let cookiesStorage = HTTPCookieStorage.shared
        let userDefaults = UserDefaults.standard
        
        if let cookieDictionary = userDefaults.dictionary(forKey: "cookiesKey") {
            
            for (_, cookieProperties) in cookieDictionary {
                if let cookie = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any] ) {
                    cookiesStorage.setCookie(cookie)
                }
            }
        }
    }
    
    func userContentController(_ userController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "rateAction" {
            print("Ta funcionando")
        }
    }
    
}

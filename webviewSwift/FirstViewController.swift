import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    
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
        webConfiguration.userContentController.add(self, name:"interOp")
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
            let myURL = URL(string:"https://admin:admin@ccstore-stage-zdoa.oracleoutsourcing.com/gendai/cep")
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
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let sendDate = message.body as! NSDictionary
        print(sendDate)
        webView!.evaluateJavaScript("rateApp()", completionHandler: nil)
    }
    
}

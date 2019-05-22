import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1
        pulseAnimation.repeatCount = 100
        pulseAnimation.autoreverses = true
        pulseAnimation.fromValue = 1.05
        pulseAnimation.toValue = 0.7
        logo.layer.add(pulseAnimation, forKey: "scale")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { 
            let controller:FirstViewController = self.storyboard!.instantiateViewController(withIdentifier: "Main") as! FirstViewController
            controller.view.frame = self.view.bounds;
            controller.willMove(toParent: self)
            self.view.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
        }
    }
    
    
    
}

//
//  SecondViewController.swift
//  webviewSwift
//
//  Created by diego.rios on 15/05/19.
//  Copyright © 2019 diego.rios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var btnRetry: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnRetry.layer.borderWidth = 2.0
        btnRetry.layer.borderColor = (UIColor(red: 169, green: 52, blue: 79, alpha: 1)).cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Recarregar(_ sender: Any) {
        let controller:FirstViewController = self.storyboard!.instantiateViewController(withIdentifier: "Main") as! FirstViewController
        controller.view.frame = self.view.bounds;
        controller.willMove(toParent: self)
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
}

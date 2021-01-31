//
//  ViewController.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    var welcome = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if welcome {
            let welcomeVC = WelcomeController()
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: false) { [self] in
                welcome = false
            }
        } else {
            let welcomeVC = GridController()
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: false) {
                
            }
        }
    }
}


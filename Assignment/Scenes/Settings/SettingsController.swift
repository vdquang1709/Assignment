//
//  SettingsController.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

class SettingsController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet internal weak var closeBtn: UIButton!
    @IBOutlet internal weak var tableView: UITableView!
    
    internal var settingItems: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setup()
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

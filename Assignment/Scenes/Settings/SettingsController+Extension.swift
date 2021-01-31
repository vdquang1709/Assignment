//
//  SettingsController+Extension.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension SettingsController {
    internal func fetchData() {
        self.settingItems = SettingData.fetchData()
    }

    internal func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UnlockPremiumCell.nib(), forCellReuseIdentifier: UnlockPremiumCell.identifier)
        self.tableView.register(MenuCell.nib(), forCellReuseIdentifier: MenuCell.identifier)
        self.tableView.register(LogoutCell.nib(), forCellReuseIdentifier: LogoutCell.identifier)
    }
}



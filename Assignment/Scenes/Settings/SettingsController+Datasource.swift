//
//  SettingsController+Datasource.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension SettingsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.settingItems.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.row
        
        if index == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: UnlockPremiumCell.identifier) as! UnlockPremiumCell
            return cell
        }
        
        if index == self.settingItems.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LogoutCell.identifier) as! LogoutCell
            return cell
        }
        
        index -= 1
        if index < self.settingItems.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier) as! MenuCell
            cell.configure(image: self.settingItems[index].0, text: self.settingItems[index].1)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        if index == 0{
            return Dimensions.settingUnlockPremiumCellHeight
        }
        
        if index == self.settingItems.count + 1 {
           return Dimensions.settingLogoutCellHeight
        }
        
        return Dimensions.settingMenuItemCellHeight
    }
}

//
//  SettingsController+Delegate.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import UIKit

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print("index \(index)")
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

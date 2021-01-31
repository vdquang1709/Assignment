//
//  SettingData.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/31/21.
//

import Foundation

class SettingData {
    public static func fetchData() -> [(String, String)] {
        return [
            ("ic_restore", "Restore"),
            ("ic_rating", "Rating"),
            ("ic_share", "Share App"),
            ("ic_contact", "Contact Us"),
            ("ic_tos", "Team Of Services"),
            ("ic_privacy", "Privacy Policy")
        ]
    }
}

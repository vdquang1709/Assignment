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
            ("ic_restore", Strings.restore),
            ("ic_rating", Strings.rating),
            ("ic_share", Strings.shareApp),
            ("ic_contact", Strings.contactUs),
            ("ic_tos", Strings.teamOfServices),
            ("ic_privacy", Strings.privacyPolicy)
        ]
    }
}

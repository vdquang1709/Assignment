//
//  Constants.swift
//  HomeWork3
//
//  Created by Vũ Duy Quang on 1/23/21.
//

import UIKit

struct Colors {
    static let usernameTextFieldBorderCorlor = UIColor.init(hex: "F1F6F7")
    static let continueBtnShadowColor = UIColor.init(hex: "000000", alpha: 0.3)
    static let usernameTextFieldBackgroundCorlor = UIColor.init(hex: "FFFFFF", alpha: 0.3)
    static let backgroundGradientStart = UIColor.init(hex: "06262C", alpha: 0.3)
    static let statisticViewBorder = UIColor.init(hex: "E7E7E7")
    static let backgroundGradientEnd = UIColor.init(hex: "19505A")
    static let imageGridBackground = UIColor.init(hex: "3E7F8B")
    static let gridGradientStart = UIColor.init(hex: "000000", alpha: 0.4)
    static let gridGradientEnd = UIColor.init(hex: "000000", alpha: 0.0)
    static let tagLineFirstHalf = UIColor.init(hex: "FFFFFF", alpha: 0.5)
    static let tagLineSecondHalf = UIColor.init(hex: "FFFFFF", alpha: 1.0)
    static let usernamePlaceholder = UIColor.init(hex: "FFFFFF")
}

struct Fonts {
    static let tagLineFirstHalf = "SFUIText-Regular"
    static let tagLineSecondHalf = "SFUIText-Bold"
    static let preminumTitle = "SFUIText-Semibold"
    static let preminumSubtitle = "SFUIText-Light"
}

struct Dimensions {
    static let castTVfItemHeight:Float = 120.0
    static let castTVItemPadding: Float = 10.0
    static let castTVNumberItemInLine : Int = 2
    static let castTVItemCornerRadius: CGFloat = 18.0
}

struct Images {
    static let grid = "ic_feature_grid"
    static let grid2 = "ic_feature_grid_2"
    static let save = "ic_feature_save"
    static let video = "ic_feature_video"
    static let share = "ic_feature_share"
    static let removeAds = "ic_feature_ads"
}

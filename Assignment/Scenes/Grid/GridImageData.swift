//
//  GridImageData.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import Foundation

class GridImageData {
    private static let data: [String] = [
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "17"
    ]
    
    public static func fetchData(size: Int) -> [String] {
        let result = data[0...(size-1)]
        return Array(result)
    }
}

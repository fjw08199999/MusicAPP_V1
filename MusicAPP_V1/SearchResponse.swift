//
//  SearchResponse.swift
//  MusicAPP_V1
//
//  Created by fred fu on 2021/11/8.
//

import Foundation


struct SearchResponse: Codable {
    let resultCount: Int
    let results: [StoreItem]
}

struct StoreItem: Codable {
    let artistName: String
    let trackName: String
    let collectionName: String?
    let previewUrl: URL
    let artworkUrl100: URL
    let trackPrice: Double?
    let releaseDate: Date
    let isStreamable: Bool?
    
//    var artworkUrl500: URL {
//        artworkUrl100.deletingLastPathComponent().appendingPathComponent("500x500.jpg")
//    }
}

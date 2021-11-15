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
}


let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
let url = URL(string: urlStr)
if let url = url {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                print(searchResponse.results[3].trackName)
            } catch {
                print(error)
            }
            
        }
    }.resume()
}


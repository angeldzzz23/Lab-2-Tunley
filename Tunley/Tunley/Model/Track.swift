//
//  Track.swift
//  Tunley
//
//  Created by Angel Zambrano on 2/28/23.
//

import Foundation


struct TracksResponse: Codable {
    let resultCount: Int
    let results: [Track]
}

// MARK: - Result
struct Track:Codable {
    let trackName: String
    let artistName: String
    let artworkUrl100: String
    // detail
    let collectionName: String
    let primaryGenreName: String
    //
    let releaseDate: Date // this gives us nil
    let trackTimeMillis: Int
}







// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}

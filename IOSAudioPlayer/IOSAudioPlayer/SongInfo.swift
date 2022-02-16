//
//  SongInfo.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/12/22.
//


import Foundation
struct SongInfo:Equatable{
   
    
    var songName:String
    let songTitle:String
    let songArtist:String
    let songImage:String
    let songExt:String
    
    static func == (lhs: SongInfo, rhs: SongInfo) -> Bool {
        return lhs.songName ==  rhs.songName
    }
}

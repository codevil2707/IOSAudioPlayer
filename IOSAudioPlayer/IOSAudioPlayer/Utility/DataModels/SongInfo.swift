//
//  SongInfo.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/12/22.
//


import Foundation
import AVFoundation
struct SongInfo:Equatable{
   
    
    var songName:String
    var songUrl:URL
    var songDuration:Float
    let songArtist:String
    let songImage:String
    let songExt:String
    
    static func == (lhs: SongInfo, rhs: SongInfo) -> Bool {
        return lhs.songName ==  rhs.songName
    }
    
    init(songName:String,songArtist:String,songImage:String, songExt:String){
        
        self.songName = songName
        self.songArtist = songArtist
        self.songImage = songImage
        self.songExt = songExt
        
        // get url from  bundle
        self.songUrl =  Bundle.main.url(forResource: songName, withExtension: songExt) ?? URL(fileURLWithPath: "")
        // save url
        // create AVURLAsset
        let audioAsset = AVURLAsset.init(url: self.songUrl, options: nil)
        // get avurlasset.duration
        let duration = CMTimeGetSeconds(audioAsset.duration)
        // save to local
        self.songDuration = Float(duration)
        print("url",self.songUrl)
        print("duration",self.songDuration)
    }
   
}

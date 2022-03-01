//
//  AlbumStruct.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/25/22.
//

import Foundation
import UIKit

struct AlbumStruct{
    var albumName:String?
    var albumImage:UIImage?
    var albumPlaylist:[SongInfo]?
    var albumMode:AlbumMode
}

enum AlbumMode : String{
    case Default = "DEFAULT"
    case User = "USER"
}

enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone // iPhone and iPod touch style UI
    case pad   // iPad style UI (also includes macOS Catalyst)
}

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

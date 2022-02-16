//
//  Album Of Playlist.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/12/22.
//

import Foundation
import UIKit
var albumPlaylistArray = [
    AlbumStruct(albumName: "", albumImage: UIImage(named: ""), albumPlaylist: [SongInfo(songName: "", songTitle: "", songArtist: "", songImage: "", songExt: "")]),
    AlbumStruct(albumName: "Sufi", albumImage: UIImage(named: "Sufi"), albumPlaylist: [SongInfo(songName: "Kithe Chaliye Tu", songTitle: "Kithe-chaliye-tu", songArtist: "Jubin Nautiyal", songImage:"Kithe Chaliye Tu" , songExt: "mp3"),
                SongInfo(songName: "Filhaal-2-Mohabbat", songTitle:  "Filhaal-2-Mohabbat", songArtist: "B-praak", songImage:  "Filhaal-2-Mohabbat", songExt:"mp3")]),
    AlbumStruct(albumName: "Bollywood", albumImage: UIImage(named: "Bollywood"), albumPlaylist: [  SongInfo(songName: "Hawayein", songTitle: "Hawayein",songArtist: "Arijit Singh" ,songImage: "Hawayein", songExt: "mp3"),SongInfo(songName: "Barns Courtney-Fire", songTitle: "Barns Courtney-Fire",songArtist: "Barns Courtney", songImage: "Barns Courtney-Fire", songExt: "mp3"),
        SongInfo(songName: "Yaariyan", songTitle: "Yaariyan", songArtist: "Mohd Irfan",songImage: "Yaariyan", songExt: "mp3")]),
    AlbumStruct(albumName: "Pop", albumImage: UIImage(named: "Pop"), albumPlaylist: [  SongInfo(songName: "Aashiqui Aa Gayi", songTitle: "Aashiqui Aa Gayi", songArtist: "Radhe Shyam",songImage: "Aashiqui Aa Gayi", songExt: "mp3"),
        SongInfo(songName: "Baliye Re - Jersey", songTitle: "Baliye Re - Jersey", songArtist: "Stebin ben",songImage: "Baliye Re - Jersey", songExt: "mp3"),SongInfo(songName: "Brown Munde", songTitle: "Brown Munde", songArtist: "AP Dhillon",songImage: "Brown Munde", songExt: "mp3")]),
       AlbumStruct(albumName: "Romantic", albumImage: UIImage(named: "Romantic"), albumPlaylist: [ SongInfo(songName: "Din Raat", songTitle: "Din Raat", songArtist: "Garry Sandhu",songImage: "Din Raat", songExt: "mp3"),SongInfo(songName: "Jane Wale Laut Kar Tu Aaya Kyon Nahi", songTitle: "Jane Wale Laut Kar Tu Aaya Kyon Nahi", songArtist: "B-Praak,Neha Kakkar",songImage: "Jane Wale Laut Ke Aaya Kyun Nhi", songExt: "mp3"),SongInfo(songName: "Rabb Jane", songTitle: "Rabb Jane", songArtist: "Garry Sandhu",songImage: "Rabb Jane", songExt: "mp3"),
    SongInfo(songName: "Soch Liya", songTitle: "Soch Liya", songArtist: "Radhe Shyam",songImage: "Soch Liya", songExt: "mp3")]),
            AlbumStruct(albumName: "Sad Romantic", albumImage: UIImage(named: "Sad-Romantic"), albumPlaylist:  [SongInfo(songName: "jind Meriye - Jersey", songTitle: "jind Meriye - jersey", songArtist: "Stebin Ben",songImage: "jind Meriye - jersey", songExt: "mp3"),
    SongInfo(songName: "Main Agar Saamne", songTitle: "Main Agar Samne", songArtist: "Abhijit Singh, Alka Yagini",songImage: "Main Agar Samne", songExt: "mp3"),SongInfo(songName: "Mera Dil Bhi Kitna Pagal Hai", songTitle: "Mera Dil Bhi Kitna Pagal Hai", songArtist: "Abhijit Singh, Alka Yagini",songImage: "Mera Dil Bhi Kitna Pagal Hai", songExt: "mp3"),SongInfo(songName: "One Touch", songTitle: "One Touch", songArtist: "Garry Sandhu",songImage: "One Touch", songExt: "mp3")])

    ]

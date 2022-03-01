//
//  Album Of Playlist.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/12/22.
//

import Foundation
import UIKit
var albumPlaylistArray = [
    AlbumStruct(albumName: "", albumImage: UIImage(named: ""), albumPlaylist: [SongInfo(songName: "",songArtist: "", songImage: "", songExt: "")],albumMode: .Default),
    AlbumStruct(albumName: "Sufi", albumImage: UIImage(named: "Sufi"), albumPlaylist: [SongInfo(songName: "Kithe Chaliye Tu",songArtist: "Jubin Nautiyal", songImage:"Kithe Chaliye Tu" , songExt: "mp3"),
                SongInfo(songName: "Filhaal-2-Mohabbat",songArtist: "B-praak", songImage:  "Filhaal-2-Mohabbat", songExt:"mp3")],albumMode: .Default),
    AlbumStruct(albumName: "Bollywood", albumImage: UIImage(named: "Bollywood"), albumPlaylist: [  SongInfo(songName: "Hawayein",songArtist: "Arijit Singh" ,songImage: "Hawayein", songExt: "mp3"),SongInfo(songName: "Barns Courtney-Fire",songArtist: "Barns Courtney", songImage: "Barns Courtney-Fire", songExt: "mp3"),
        SongInfo(songName: "Yaariyan",songArtist: "Mohd Irfan",songImage: "Yaariyan", songExt: "mp3")],albumMode: .Default),
    AlbumStruct(albumName: "Pop", albumImage: UIImage(named: "Pop"), albumPlaylist: [  SongInfo(songName: "Aashiqui Aa Gayi", songArtist: "Radhe Shyam",songImage: "radheyShyam", songExt: "mp3"),
        SongInfo(songName: "Baliye Re - Jersey", songArtist: "Stebin ben",songImage: "jersey", songExt: "mp3"),SongInfo(songName: "Brown Munde", songArtist: "AP Dhillon",songImage: "brownMunde", songExt: "mp3")],albumMode: .Default),
       AlbumStruct(albumName: "Romantic", albumImage: UIImage(named: "Romantic"), albumPlaylist: [ SongInfo(songName: "Din Raat", songArtist: "Garry Sandhu",songImage: "garrySandhu", songExt: "mp3"),SongInfo(songName: "Jane Wale Laut Kar Tu Aaya Kyon Nahi",songArtist: "B-Praak,Neha Kakkar",songImage: "bPraak", songExt: "mp3"),SongInfo(songName: "Rabb Jane",songArtist: "Garry Sandhu",songImage: "garrySandhu2", songExt: "mp3"),
    SongInfo(songName: "Soch Liya",songArtist: "Radhe Shyam",songImage: "radheyShyam", songExt: "mp3")],albumMode: .Default),
            AlbumStruct(albumName: "Sad Romantic", albumImage: UIImage(named: "Sad-Romantic"), albumPlaylist:  [
    SongInfo(songName: "Main Agar Saamne",songArtist: "Abhijit Singh, Alka Yagini",songImage: "AA", songExt: "mp3"),SongInfo(songName: "Mera Dil Bhi Kitna Pagal Hai", songArtist: "Abhijit Singh, Alka Yagini",songImage: "AA", songExt: "mp3"),SongInfo(songName: "One Touch",songArtist: "Garry Sandhu",songImage: "garrySandhu", songExt: "mp3")],albumMode: .Default)

    ]

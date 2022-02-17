//
//  Playlist.swift
//  Xylophone
//
//  Created by SimplyEntertaining on 12/25/21.
//
import AVFoundation
import Foundation
var volume:Float = 0.5

struct PlayerLogic{
    
    //MARK: - Properties
  
 var audioPlayer:AVAudioPlayer!
 ///index of current Song
 var currentSongIndex : Int = 1
 ///a bool to know the status of song playing
 var isSongPlaying = false
 ///store current value of song
   
 var recentPlayedSong = [SongInfo]()


 // MARK: - PLAYER LOGIC

 mutating func loadCurrentSong(){
     let _ = loadPlayer(withNewURL: songlist[currentSongIndex].songUrl)
 }
 ///create object of AVAudioplayer and return did succed as bool
 mutating func loadPlayer(withNewURL:URL)->Bool{
     var didSucced:Bool = false
     audioPlayer = try! AVAudioPlayer(contentsOf: withNewURL)
     didSucced = true
     audioPlayer.prepareToPlay()
     return(didSucced)
    
 }

 mutating func getSongInSongHistory(){
     recentPlayedSong.append(songlist[currentSongIndex])
     print(recentPlayedSong)
     
 }


 func getDurationOfSong()->Float{
     print(audioPlayer.duration)
    return Float(audioPlayer.duration)
 }

 func getCurrentTimeOfSong()->Float{
     return Float(audioPlayer.currentTime)
 }

 func getRemainingTime()->Float{
   let remainingTime = audioPlayer.duration - audioPlayer.currentTime
   
     return Float(remainingTime)
 }

  //MARK: - Update Functions
 func updateSongImageName()->String{
     return songlist[currentSongIndex].songImage
 }


 func updateSongTitleName()->String{
     return songlist[currentSongIndex].songName
 }

 func updateSongArtistName()->String{
     return songlist[currentSongIndex].songArtist
 }
  
 // MARK: - PLAY/PAUSE Button LOGIC
 ///It will play ths song
 mutating func didPlay(){
     audioPlayer.play()
     isSongPlaying = true
     
 }
 ///it will pause the song
  mutating func didPause(){
     audioPlayer.pause()
     isSongPlaying = false
 }

 ///It sop the song and set current song time at 0
 mutating func didStop(){
      audioPlayer.stop()
      audioPlayer.currentTime=0
      isSongPlaying = false
     
    }

 ///it will stop the song and play from start
 mutating func didReplay(){
     didStop()
     didPlay()
 }


 //MARK: - NEXT/PRE SONG METHOD

 ///play next song if avilable in list otherwise stop current song
 mutating func didPlayNextSong(){

     if(currentSongIndex == songlist.count-1){
        didStop()
         isSongPlaying = false
             
         
     }
     else {
         getSongInSongHistory()
         currentSongIndex +=  1
         loadCurrentSong()
         
         if(isSongPlaying){
        didPlay()
         }
         else {
             didStop()
             
         }
     }
 }

 ///play previous song if avilable otherwise restart current song
 mutating func didplayPreviousSong(){
     if(currentSongIndex==0){
         if (isSongPlaying){
           didReplay()
         }
         else{
             didStop()
         }
     }
     else{
         getSongInSongHistory()
        currentSongIndex = currentSongIndex - 1
         loadCurrentSong()
         if(isSongPlaying){
         didPlay()
         }
         else {
             didStop()
         }
     }
 }

 //MARK: - VOLUME CONTROL

    mutating func setVolumeInSlider(){
        audioPlayer.volume = Float(volume)
 }
 //
 //MARK: - Handy Function
    ///convert volume float to string
 func convertFloatToPercentageAsString(value:Float)->String{
    var percentage: Float
    percentage = (value * Float(100.0).rounded(toPlaces: 2))
    print("voume: ", Int(percentage))
    return "\(Int(percentage))"
 }



 func convertTimeFormat(_ time:Float)->String{
     let durationInSec = Int(time)
     var hour:Int = 00
     var  min:Int = 00
     var sec:Int = 00
     // if hour
     if(durationInSec>3600){
         hour = durationInSec/3600
         min = (durationInSec%3600)/60
         sec = (durationInSec%3600)%60
        
         return "\(hour) : \(min) : \(sec)"
     } // if has minutes
     else if(durationInSec>60){
         min = durationInSec/60
         sec = durationInSec%60
         return "\(min) : \(sec)"
     }
     else{
         sec = durationInSec
        
         return "\(min) : \(sec)"
     }
     
 }



 }

 //MARK: - EXTENSION
 extension Float {
 /// Rounds the double to decimal places value
 func rounded(toPlaces places:Int) -> Float {
     let divisor = pow(10.0, Float(places))
     return (self * divisor).rounded() / divisor
 }
 }

    

  

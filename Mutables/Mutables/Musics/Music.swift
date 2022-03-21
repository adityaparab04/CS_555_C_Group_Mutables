//
//  Music.swift
//  Mutables
//
//  Created by Rahul Pawar on 3/20/22.
//

import Foundation
import AVFoundation

var player : AVAudioPlayer?

class Music{
    
    func startMusic(fileName: String, format: String, volume: Float, loop: Int){
        let urlString = Bundle.main.path(forResource: fileName, ofType: format)
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString  = urlString else {return}
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let player = player else {return}
            print("Music is playing")
            player.volume = volume
            player.numberOfLoops = loop
            player.play()
            
        }catch{
            print("Something is wrong with the music")
        }
    }
    
    
}

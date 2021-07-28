//
//  PlaySound.swift
//  DevelopersApp
//
//  Created by Rami Ounifi on 28/7/2021.
//

import AVFoundation
import Foundation

// MARK: - AudioPlayer

var audioPlayer: AVAudioPlayer?

func playsound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            debugPrint("could not find the sounnd file")
        }
    }
    }

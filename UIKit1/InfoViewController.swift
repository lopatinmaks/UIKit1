//
//  InfoViewController.swift
//  UIKit1
//
//  Created by Ольга on 15.10.2022.
//

import UIKit
import AVFoundation

final class PlayerViewController: UIViewController {
    
    var theImagePassed = UIImage()
    var player = AVAudioPlayer()
    var playerOne = AVAudioPlayer()
    let slider = UISlider()
    var pictureForSong = ""
    var countSong = 0
 
    @IBOutlet private var iconSong: UIImageView!
    @IBOutlet private var sliderVolume: UISlider!
    @IBOutlet private var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconSong.image = UIImage(named: pictureForSong)
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 300, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPathOne = Bundle.main.path(forResource: "ava-max-million-dollar-baby-david-penn-remix", ofType: "mp3") {
                try playerOne = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPathOne))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error!")
        }
        self.playerOne.play()

        do {
            if let audioPath = Bundle.main.path(forResource: "18 Мне Уже", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error!")
        }
        self.player.play()
        
        if playerOne.isPlaying {
            player.stop()
        } else {
            playerOne.stop()
            player.play()
        }
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
            self.playerOne.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func backButton(_ sender: Any) {
        if countSong == 0 {
            countSong += 1
            iconSong.image = UIImage(named: "Ava Max")
            playerOne.play()
            player.stop()
        } else {
            countSong = 0
            iconSong.image = UIImage(named: "Руки Вверх")
            player.play()
            playerOne.stop()
        }
    }
    @IBAction func forwardButton(_ sender: Any) {
        if countSong == 0 {
            countSong += 1
            iconSong.image = UIImage(named: "Ava Max")
            playerOne.play()
            player.stop()
        } else {
            countSong = 0
            iconSong.image = UIImage(named: "Руки Вверх")
            player.play()
            playerOne.stop()
        }
    }
    @IBAction func sliderVolume(_ sender: Any) {
        self.player.volume = self.sliderVolume.value
        self.playerOne.volume = self.sliderVolume.value
    }
    
    @IBAction func playAction(_ sender: Any) {

        if player.isPlaying {
            player.pause()
            pause()
        } else if playerOne.isPlaying {
            playerOne.pause()
            pause()
        } else {
            player.play()
            play()
            playerOne.play()
            play()
        }
    }
    
    func play() {
        let pauseImage = UIImage(systemName: "pause.fill")
        playButton.setImage(pauseImage, for: .normal)
    }
    func pause() {
        let playImage = UIImage(systemName: "play.fill")
        playButton.setImage(playImage, for: .normal)
    }
}




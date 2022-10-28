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
   // var pictureForSong = ""
//    var song = ""
//    var singer = ""
    
    @IBOutlet private var iconSong: UIImageView!
    @IBOutlet private var sliderVolume: UISlider!
    @IBOutlet private var playButton: UIButton!
    let slider = UISlider()
    var pictureForSong = ""
    
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
            if let audioPath = Bundle.main.path(forResource: "18 Мне Уже", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error!")
        }
        self.player.play()
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
   
    
    @IBAction func sliderVolume(_ sender: Any) {
        self.player.volume = self.sliderVolume.value
    }
    
    @IBAction func playAction(_ sender: Any) {

        if player.isPlaying {
            player.pause()
            pause()
        } else {
            player.play()
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




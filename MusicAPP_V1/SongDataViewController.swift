//
//  SongDataViewController.swift
//  MusicAPP_V1
//
//  Created by fred fu on 2021/11/8.
//

import UIKit
import AVFoundation


class SongDataViewController: UIViewController {
    
    let item: StoreItem
    var player: AVPlayer?
    
    
    init?(coder: NSCoder, item: StoreItem) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBOutlet weak var showBigPhotoImageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBigPhotoImageOutlet.image = UIImage(systemName: "music.house")

        URLSession.shared.dataTask(with: item.artworkUrl100) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.showBigPhotoImageOutlet.image = UIImage(data: data)
                    
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playButtonAction(_ sender: Any) {
        player = AVPlayer(url: item.previewUrl)
        player?.play()
    }
    
}

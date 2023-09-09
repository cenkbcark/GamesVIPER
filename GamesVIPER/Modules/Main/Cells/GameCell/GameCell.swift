//
//  GameCell.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import UIKit

final class GameCell: UICollectionViewCell {

    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var gameTitleLabel: UILabel!
    @IBOutlet weak private var gameDescriptionLabel: UILabel!
    @IBOutlet weak private var gameImageView: UIImageView!
    @IBOutlet weak private var gameGenreLabel: UILabel!
    @IBOutlet weak private var goButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func setModels(_ model: GamesResponseModelElement?) {
        guard let model = model else { return }
        gameTitleLabel.text = model.title
        gameDescriptionLabel.text = model.shortDescription
        gameGenreLabel.text = model.developer
        
        guard let thumbnail = model.thumbnail else { return }
        ImageDownloader.downloadImage(from: thumbnail) { image in
            DispatchQueue.main.async {
                self.gameImageView.image = image
            }
        }
    }
    
    private func configureCell() {
        containerView.layer.cornerRadius = 30
        gameImageView.layer.cornerRadius = 30
        goButton.layer.cornerRadius = goButton.frame.height / 2
        goButton.layer.borderWidth = 3
        goButton.layer.borderColor = UIColor.white.cgColor
    }
}

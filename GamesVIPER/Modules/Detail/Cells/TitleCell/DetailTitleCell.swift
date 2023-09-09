//
//  DetailTitleCell.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import UIKit

final class DetailTitleCell: UITableViewCell {
    
    @IBOutlet weak private var gameImageView: UIImageView!
    @IBOutlet weak private var gameTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(with model: GamesDetailModel?) {
        guard let model = model else { return }
        gameTitleLabel.text = model.title
        ImageDownloader.downloadImage(from: model.screenshots.first?.image ?? "") { image in
            DispatchQueue.main.async {
                self.gameImageView.image = image
            }
        }
        
    }
    
}

//
//  DetailDescriptionCell.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import UIKit

final class DetailDescriptionCell: UITableViewCell {
    
    @IBOutlet weak private var gameGenreLabel: UILabel!
    @IBOutlet weak private var gameDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(with model: GamesDetailModel?) {
        guard let model = model else { return }
        self.gameGenreLabel.text = model.genre
        self.gameDescriptionLabel.attributedText = htmlToString(model)
        self.gameDescriptionLabel.textColor = .white
    }
    
    private func htmlToString(_ string: GamesDetailModel?) -> NSAttributedString? {
        if let htmlString = string?.description {
            if let data = htmlString.data(using: .utf8) {
                if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                    return attributedString
                }
            }
        }
        return nil
    }
}

//
//  HeaderTableViewCell.swift
//  Travelio
//
//  Created by Rahul Gala on 05/01/21.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 22)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 18)
    }

    func setup(model: DayModel){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        titleLabel.text = formatter.string(from: model.title)
        subtitleLabel.text = model.subtitle
    
        
    }

}

//
//  TripsTableViewCell.swift
//  Travelio
//
//  Created by Rahul Gala on 02/01/21.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowsAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 42.0)
        cardView.backgroundColor = Theme.accent
        
    }
    
    
    func setup(tripModel: TripModel){
        titleLabel.text = tripModel.title
    }


}

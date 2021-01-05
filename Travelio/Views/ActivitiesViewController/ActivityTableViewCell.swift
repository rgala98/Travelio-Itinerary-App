//
//  ActivityTableViewCell.swift
//  Travelio
//
//  Created by Rahul Gala on 05/01/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardView: UIView!
    
  
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowsAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontNameSemiBold, size: 22)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 18)
    }

    func setup(model: ActivityModel){
        
        cellImageView.image = getActivityImage(activityType: model.activityType)
        
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        
    }
    
    func getActivityImage(activityType: ActivityType) -> UIImage? {
        
        switch activityType {
        
        case .auto:
            return UIImage(named: "carIcon")
        case .excursion:
            return UIImage(named: "compassIcon")
        case .flight:
            return UIImage(named: "planeIcon")
        case .food:
            return UIImage(named: "foodIcon")
        case .hotel:
            return UIImage(named: "hotelIcon")
        }
    }

}

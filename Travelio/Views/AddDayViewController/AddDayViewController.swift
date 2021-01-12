//
//  AddDayViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class AddDayViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var cancelButton: ActionUIButton!
    @IBOutlet weak var saveButton: ActionUIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var doneSaving: ((DayModel) -> ())?
    var tripIndex: Int!
    var tripModel: TripModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: UIButton) {
    
        if alreadyExists(datePicker.date) {
            let alert = UIAlertController(title: "Day already exits", message: "Choose another date.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let dayModel = DayModel(title: datePicker.date, subtitle: descTextField.text ?? "", data: nil)
        
        DayFunctions.createDay(at: tripIndex, using: dayModel)
        
        
        if let doneSaving = doneSaving{
            doneSaving(dayModel)
        }
        dismiss(animated: true)
        
    }

    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func alreadyExists(_ date: Date) -> Bool{
        
//        if tripModel.dayModels.contains(where: { (dayModel) -> Bool in
//            return dayModel.title == date
//        }){
//            return true
//        }
        
        if tripModel.dayModels.contains(where: { $0.title.mediumDate == date.mediumDate }){
            return true
        }
        
        return false
    }
    
    

}

//
//  AddActivityViewController.swift
//  Travelio
//
//  Created by Rahul Gala on 12/01/21.
//

import UIKit

class AddActivityViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    
    var tripIndex: Int!
    var tripModel: TripModel!
    
    var doneSaving: ((Int, ActivityModel) -> ())?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24.0)
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
    }
    

  
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        
        activityTypeButtons.forEach({$0.tintColor = Theme.accent})
        
        sender.tintColor = Theme.tintColor
    }
    
    
    @IBAction func save(_ sender: ActionUIButton) {
        
        guard titleTextField.hasValue, let newTitle = titleTextField.text else {
            return
        }
        
        let activitytype: ActivityType = getSelectedActivityType()
        
        let dayIndex = dayPickerView.selectedRow(inComponent: 0)
        let activityModel = ActivityModel(title: newTitle, subTitle: subtitleTextField.text ?? "", activityType: activitytype)
        
        ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, using: activityModel)
        
        
        if let doneSaving = doneSaving{
            doneSaving(dayIndex, activityModel)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func getSelectedActivityType() -> ActivityType{
        for (index, button) in activityTypeButtons.enumerated(){
            if button.tintColor == Theme.tintColor{
                return ActivityType(rawValue: index) ?? .excursion
            }
        }
        
        return .excursion
    }
    
    
    @IBAction func cancel(_ sender: ActionUIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
}








extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tripModel.dayModels[row].title.mediumDate
    }
    
    
    
    
}


//
//  ViewController.swift
//  MealRater
//
//  Created by Kimberly Barboza on 4/18/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtResturant: UITextField!
    @IBOutlet weak var txtDish: UITextField!
    @IBOutlet weak var Lable: UILabel!
    
    var currentMeal: Meal?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if currentMeal == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentMeal = Meal(context: context)
        }
        currentMeal?.resturant = txtResturant.text
        currentMeal?.dish = txtDish.text
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetRating(_:)), name: Notification.Name("rate"), object: nil)
        
        // Do any additional setup after loading the view.
        
        //updated currentMeal with the values entered
        
        //textFields listeners used to save data
        let textFields:[UITextField] = [txtResturant, txtDish]
        
        for textField in textFields{
            textField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)),
                                for: UIControl.Event.editingDidEnd)
        }
    }
    @objc func saveMeal() {
        appDelegate.saveContext()
        
    }
    @objc func didGetRating(_ notification: Notification){
            let rate = notification.object as! String?
            Lable.text = rate
        }
    
    @IBAction func didTapButton (){
        let vc = storyboard?.instantiateViewController(withIdentifier: "rateView") as! RateViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(self.saveMeal))
    }
    
    

    

}


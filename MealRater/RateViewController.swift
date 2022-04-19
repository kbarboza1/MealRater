//
//  RateViewController.swift
//  MealRater
//
//  Created by Kimberly Barboza on 4/18/22.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var sgmtRate: UISegmentedControl!
    @IBOutlet weak var lblRate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeRate(_ sender: Any) {
        if sgmtRate.selectedSegmentIndex == 0 {
            lblRate.text = "Rate: 1"
        }else if sgmtRate.selectedSegmentIndex == 1{
            lblRate.text = "Rate: 2"
        }else if sgmtRate.selectedSegmentIndex == 2 {
            lblRate.text = "Rate: 3"
        }else if sgmtRate.selectedSegmentIndex == 3 {
            lblRate.text = "Rate: 4"
        }else if sgmtRate.selectedSegmentIndex == 4 {
            lblRate.text = "Rate: 5"
        }
        
       
        
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("rate"), object: lblRate.text)
        
        dismiss(animated: true, completion: nil)
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


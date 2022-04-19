//
//  ViewController.swift
//  MealRater
//
//  Created by Kimberly Barboza on 4/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Lable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetRating(_:)), name: Notification.Name("rate"), object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func didGetRating(_ notification: Notification){
            let rate = notification.object as! String?
            Lable.text = rate
        }
    
    @IBAction func didTapButton (){
        let vc = storyboard?.instantiateViewController(withIdentifier: "rateView") as! RateViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    

}


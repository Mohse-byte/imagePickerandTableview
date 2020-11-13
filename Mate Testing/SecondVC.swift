//
//  SecondVC.swift
//  Mate Testing
//
//  Created by Monish Chopra on 09/11/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var FirstTxt: UITextField!
    @IBOutlet weak var SecondTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextBtntapped(_ sender: Any) {
        
        let third:ThirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as! ThirdVC
        
        third.name = FirstTxt.text ?? ""
        third.email = SecondTxt.text ?? "" 
        
        self.navigationController?.pushViewController(third, animated: true)
    }
    
 

}

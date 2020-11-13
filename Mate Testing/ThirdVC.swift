//
//  ThirdVC.swift
//  Mate Testing
//
//  Created by Monish Chopra on 09/11/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    var name: String = ""
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstLbl.text = name
        secondLbl.text = email
        
    }
    
    @IBAction func ShareBtnTapped(_ sender: Any) {
        
        //MARK:- For Sharing App Link, Invitation, Sending Images Etc.
        //MARK:- if you want to share image just make image outlet and pass in activity items like self.imageview.image
        //it will share a given image.
        
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
       
    }
    

}

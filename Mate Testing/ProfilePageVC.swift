//
//  ProfilePageVC.swift
//  Mate Testing
//
//  Created by Monish Chopra on 09/11/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit

class ProfilePageVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    //MARK:- Create a Global Variable of UIPicker Controller
      let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //MARK:- Making Image Look in Circle.
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        //MARK:- Adding Tap Gesture When User Click on UIimageView.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    //MARK:-Making Action when user tap on imageView.
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        showAlert()
        // Your action
        showImagePickerController()
       
        
    }


}


//MARK:- Making Extension for UIImagae Picker.
extension ProfilePageVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK:- For Picking Image form Library
    func showImagePickerController()  {
       
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    //MARK:- Selcecting Image from Photo Gallery and Dismiss.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage  {
            
            profileImage.image = editedImage
            
        } else  if let orignalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  {
                   
                   profileImage.image = orignalImage
                   
               }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func showAlert()  {
        
        let alert = UIAlertController(title: nil, message: "Choose your Preference", preferredStyle: UIAlertController.Style.actionSheet)

        alert.addAction(UIAlertAction(title: "Photo library", style: .default) { (result : UIAlertAction) -> Void in
          print("Photo selected")
          self.imagePicker.sourceType = .photoLibrary
          self.present(self.imagePicker, animated: true, completion: nil)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (result : UIAlertAction) -> Void in
                 print("Photo selected")
            
            self.dismiss(animated: true, completion: nil)
            
            })
    
//        alert.addAction(UIAlertAction(title: "Camera", style: .default) { (result : UIAlertAction) -> Void in
//           print("Camera selected")
//           self.imagePicker.sourceType = .camera
//           self.present(self.imagePicker, animated: true, completion: nil)
//         })

        self.present(alert, animated: true, completion: nil)
    }
}

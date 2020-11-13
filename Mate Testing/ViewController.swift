//
//  ViewController.swift
//  Mate Testing
//
//  Created by Monish Chopra on 07/11/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import Photos


class ViewController: UIViewController {

    @IBOutlet weak var addTextBtn: UIButton!
    @IBOutlet weak var addImageBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayName = ["Messi","Ronaldo","Pale","KarimBenzimma","Mo"]
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
     
    }

    @IBAction func addTextBtnTapped(_ sender: Any) {
        // create the actual alert controller view that will be the pop-up
        let alertController = UIAlertController(title: "ADD", message: "Add Name", preferredStyle: .alert)

            alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Name"
        }


        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in

            // this code runs when the user hits the "save" button

            var inputName = alertController.textFields![0].text

            self.arrayName.append(inputName ?? "")
            
            self.tableView.reloadData()
        }
        
           alertController.addAction(cancelAction)
           alertController.addAction(saveAction)

        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func addImageBtnTapped(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
              print("Button capture")

              imagePicker.delegate = self
              imagePicker.sourceType = .savedPhotosAlbum
              imagePicker.allowsEditing = false

              present(imagePicker, animated: true, completion: nil)
          }
        
    }
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.textLabel?.text = arrayName[indexPath.row]
        return cell
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            var fileName = ""
            fileName = url.lastPathComponent
            dismiss(animated: true, completion: nil)
            self.arrayName.append(fileName)
            self.tableView.reloadData()
        }

           
    }
    
}

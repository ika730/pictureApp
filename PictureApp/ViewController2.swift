//
//  ViewController2.swift
//  PictureApp
//
//  Created by Nakagawa Kosuke on 2023/07/26.
//

import UIKit
import PhotosUI
class ViewController2:UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var image1: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    @IBAction func loadimage(_ sender: UIButton) {
        print("yes")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[UIImagePickerController.InfoKey.originalImage] != nil {
            let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
                    //画像を設定する
                    image1.image = image
                }
        dismiss(animated: true,completion: nil)
    }
  
}

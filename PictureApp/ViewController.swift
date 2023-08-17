//
//  ViewController.swift
//  PictureApp
//
//  Created by Nakagawa Kosuke on 2023/07/26.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func takePhotoTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
            }
            else {
                print("Camera not available.")
            }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.originalImage] as? UIImage else {
            print("Image not found.")
            return
        }

        imageView.image = image
    }
    func getFileURL(fileName: String) -> URL {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docDir.appendingPathComponent(fileName)
    }
    @IBAction func savePhotoTapped(_ sender: Any) {
        guard let imageData = imageView.image?.jpegData(compressionQuality: 1.0) else {
                return
            }

            do {
                try imageData.write(to: getFileURL(fileName: "IMG12345.jpg"))
                print("Image saved.")
            } catch {
                print("Failed to save the image:", error)
            }
    }
    
    @IBAction func clearPhotoTapped(_ sender: Any) {
        imageView.image = nil
    }
    @IBAction func loadPhotoTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
           // 画像選択時の処理
             // ↓選んだ画像を取得
        let images = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
        imageView.image = images

    }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           // キャンセルボタンを押下時の処理
       }
    
  
    
    
}


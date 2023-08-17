//
//  ViewController3.swift
//  PictureApp
//
//  Created by Nakagawa Kosuke on 2023/07/27.
//

import UIKit
import PhotosUI

class ViewController3: UIViewController, PHPickerViewControllerDelegate{
  
    
    @IBOutlet weak var imageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func setImageButton(_ sender: UIButton) {
        setupImageView() // 追加
        let picker = generatePhotoPicker()
            picker.delegate = self // delegate を指定する

            present(picker, animated: true)
    }
    private func generatePhotoPicker() -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0

        let picker = PHPickerViewController(configuration: configuration)

        return picker
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

                guard let firstItemProvider = results.first?.itemProvider else { return }

                if firstItemProvider.canLoadObject(ofClass: UIImage.self) {
                    firstItemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                        guard let self = self else { return }

                        DispatchQueue.main.async {
                            self.imageView.image = image as? UIImage
                        }
                    }
                } else {
                    print("対応していない画像フォオーマットです")
                }
    }
    // このメソッドを追加
       private func setupImageView() {
           
           imageView.contentMode = .scaleAspectFill
           imageView.image = UIImage(systemName: "photo.on.rectangle.angled")
           imageView.translatesAutoresizingMaskIntoConstraints = false

           NSLayoutConstraint.activate([
               imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
               imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }
    
    
}
//https://blog.daichidaiji.com/photokit-playground/




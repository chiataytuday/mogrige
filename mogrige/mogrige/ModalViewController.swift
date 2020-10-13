//
//  ModalViewController.swift
//  mogrige
//
//  Created by Hyunseok Yang on 2020/10/06.
//

import UIKit
import MobileCoreServices

class ModalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    var selectedTitle: String?
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTitle.text = selectedTitle
    }
    
    
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let imoportFromAlbum = UIAlertAction(title: "앨범에서 가져오기", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.mediaTypes = [kUTTypeImage as String]
            picker.allowsEditing = false
            self.present(picker, animated: true, completion: nil)
        }
        let takePhoto = UIAlertAction(title: "카메라로 찍기", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            picker.mediaTypes = [kUTTypeImage as String]
            picker.allowsEditing = false
            self.present(picker, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        actionSheet.addAction(imoportFromAlbum)
        actionSheet.addAction(takePhoto)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)

        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            
            let captureImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            mainImage.image = captureImage
            
            self.dismiss(animated: true, completion: nil)
        }

    }


/*
extension ModalViewController: PHPickerViewControllerDelegate {

    // UIImageView에 불러온 이미지 띄우는 기능
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

        picker.dismiss(animated: true) // 1

        let itemProvider = results.first?.itemProvider // 2

        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) { // 3
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in // 4
                DispatchQueue.main.async {
                    self.mainImage.image = image as? UIImage // 5
                }
            }
        } else {
            // TODO: Handle empty results or item provider not being able load UIImage
        }
    }
   */
    
}


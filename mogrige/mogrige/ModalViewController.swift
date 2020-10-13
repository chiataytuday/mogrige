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
        // textview placeholder 기본 설정
        textDescription.delegate = self
        textDescription.text = "단어를 보고 떠오르는 생각을 적어주세요"
        textDescription.textColor = UIColor.lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 랜덤으로 선택한 키워드를 label에 보여주기
        mainTitle.text = selectedTitle
    }
    
    
    // 이미지 추가 버튼 클릭시 액션시트 구현 및 카메라, 포토라이브러리 설정
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
    
    // 선택한 이미지를 UIImageView에 띄우는 기능
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            
            let captureImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            mainImage.image = captureImage
            
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    
    // textView placeholder 구현 함수
    func textViewSetupView() {
        if textDescription.textColor == UIColor.lightGray {
            textDescription.text = nil
            textDescription.textColor = UIColor.black
        } else if textDescription.textColor == UIColor.black {
            textDescription.text = "단어를 보고 떠오르는 생각을 적어주세요"
            textDescription.textColor = UIColor.lightGray
        }
    }
}

// textView placeholder 상태 전달
extension ModalViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textViewSetupView()
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
    



//
//  ImagePickerViewController.swift
//  Grocr
//
//  Created by Thomas Bloss on 5/16/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//


import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref = GroceryListTableViewController.Reference.ref
    var imageContainer: UIImage?
    var extraRef = GroceryListTableViewController.Reference.extraRef
    let imagePicker = UIImagePickerController()
    

  func loadImageButtonTapped() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

    
    }
    
    override func viewWillAppear(animated: Bool) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageContainer = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        // EncodeImage and set value in Reference
        if let image = imageContainer {
            let imageData = UIImageJPEGRepresentation(image, 0.2)
            let base64String = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
//            print(base64String)
            let imageRef = GroceryListTableViewController.Reference.ref.childByAppendingPath("image")
            
            imageRef.setValue(base64String)
            performSegueWithIdentifier("goBack", sender: nil)

        }
        

    }
    
   
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    
}
//
//  UserEditProfileViewController.swift
//  GameNight
//
//  Created by Paige Thompson on 10/29/22.
//

import UIKit
import Parse
import AlamofireImage

class UserEditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let user = PFUser.current()
    var firstnametext = String()
    var locationtext = String()
    var biotext = String()
    var imgUrl = URL(string: String())
    @IBOutlet weak var proPicView: UIImageView!
    @IBOutlet weak var fnameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var bioField: UITextView!
    var pickedImg = false
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fnameField.text = firstnametext
        locationField.text = locationtext
        bioField.text = biotext
        if imgUrl != nil {
            self.proPicView.af.setImage(withURL: imgUrl!)
        }
        
        
        //Add a gesture recognizer onto the profile picture
        let tap = UITapGestureRecognizer(target: self, action: #selector(UserEditProfileViewController.onCameraButton))
        proPicView.addGestureRecognizer(tap)
        proPicView.isUserInteractionEnabled = true
        
        //Set profile picture to be circular
        proPicView.setRounded()

    }
    
    @objc func onCameraButton(){
        //Present Photo Gallery Images for user to choose
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Set new view of profilepicture when user is done choosing a photo from gallery
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width:300, height: 300)
        let scaledImg = image.af.imageScaled(to: size)
        
        proPicView.image = scaledImg
        pickedImg = true
        
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func onSaveButton(_ sender: Any) {
        print("save button pressed")
        changeProfile()
        
        self.dismiss(animated: true, completion: nil)
        print("dismissing controller")
        }
        

    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("cancelled user profile edits")
    }
    
    

    func changeProfile() {
        //Set up User's Profile View
        let query = PFQuery(className:"UserProfile")
        query.whereKey("user", equalTo: user!)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully editing profile.")
                // Do something with the found object
                for object in objects {
                    if self.fnameField.text != "" {
                        object["firstName"] = self.fnameField.text
                    }
                    if self.locationField.text != "" {
                        object["location"] = self.locationField.text
                    }
                    if self.bioField.text != "" {
                        object["bio"] = self.bioField.text
                    }
                    //upload image
                    let imageData = self.proPicView.image!.pngData()
                    if self.pickedImg == true  {
                        let file = PFFileObject(name: "image.png", data: imageData!)
                        object["proPic"] = file
                    }
                
                    object.saveInBackground { (success, error) in
                        if success {
                            print("successfully saved changes to profile")
                        } else {
                            print("error :\(error?.localizedDescription)")
                        }
                        
                    }
                    
                    //Want to create a set profile function
                    
                }
                
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

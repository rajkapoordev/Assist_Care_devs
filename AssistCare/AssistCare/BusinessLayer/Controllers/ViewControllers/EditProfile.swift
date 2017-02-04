//
//  EditProfile.swift
//  AssistCareOnDemand
//
//  Created by LaNet on 1/16/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class EditProfile: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var vw1: UIView!
    
    @IBOutlet var vWAddress: UIView!
    @IBOutlet var vw2: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cvcServices: UICollectionView!
    @IBOutlet var imgProfile: UIImageView!
    
    @IBOutlet var txtFirstName: UITextField!
    
    @IBOutlet var txtLastName: UITextField!
    
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var imgAddress: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.setBottomBorder()
        txtLastName.setBottomBorder()
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtAddress.delegate = self
        vWAddress.setBottomBorderView()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        cvcServices?.allowsMultipleSelection = true
          cvcServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")

        scrollView.contentSize = CGSize(width:0, height: 5 + vw1.frame.height + vw2.frame.height + cvcServices.frame.height + btnNext.frame.height + 100)
        imagePicker.delegate = self
        shadow(button: btnNext)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func pickDocument(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func pickProfileImg(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
        
  


    func shadow(button:UIButton){
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
    }

 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
{
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        imgProfile.contentMode = .scaleAspectFill
        imgProfile.image = pickedImage
    }
    dismiss(animated: true, completion: nil)
   
}
func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 13
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        cell.vWServices.frame.size = CGSize(width: cell.frame.width , height: cell.frame.width )
        cell.vWMark.frame = cell.vWServices.frame
        cell.imgMark.frame = cell.vWServices.frame
        cell.vWMark.setRounded()
        cell.imgMark.setRounded()
        cell.vWServices.setRounded()
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
           
    let numOfColumnsInRow = 3
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
              let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        
        cvcServices.frame = CGRect(x: cvcServices.frame.origin.x, y: cvcServices.frame.origin.y, width: cvcServices.frame.width, height: (CGFloat(size) *  CGFloat(ceil(13/3)) + (items * CGFloat(ceil(13/3)))))
        scrollView.contentSize = CGSize(width:0, height: 5 + vw1.frame.height + vw2.frame.height + cvcServices.frame.height + btnNext.frame.height + 100)
        btnNext.frame = CGRect(x: btnNext.frame.origin.x, y: (cvcServices.frame.origin.y + cvcServices.frame.height), width: btnNext.frame.width, height: btnNext.frame.height)

    return CGSize(width: size, height: size)
    

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtFirstName
        {
            txtLastName.becomeFirstResponder()
            return true
        }
        else if textField == txtLastName
        {
            txtAddress.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        
        if selectedCell.isSelected == true
        {
            selectedCell.vWMark.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            selectedCell.vWMark.isHidden = false
            selectedCell.imgMark.isHidden = false
        }
        else
        {
            selectedCell.vWMark.isHidden = true
                selectedCell.imgMark.isHidden = true
        }
        
       // var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
       
        
        selectedCell.vWMark.isHidden = true
        selectedCell.imgMark.isHidden = true

    }

    
    
    @IBAction func btnNext(_ sender: UIButton) {
        let vc = SetupServicesVC(nibName: "SetupServicesVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



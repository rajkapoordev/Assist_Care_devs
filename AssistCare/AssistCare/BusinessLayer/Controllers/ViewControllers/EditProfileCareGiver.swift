//
//  EditProfileCareGiver.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class EditProfileCareGiver: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet var vwStatusBar: UIView!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    //first view in scroll
    @IBOutlet var vwCareGiverInfo: UIView!
    
    @IBOutlet var imgProfile: UIImageView!
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var vWPicker: UIView!
    @IBOutlet var vWSelectAdd: UIView!
    @IBOutlet var btnLogout: UIButton!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnLanguage: UIButton!
    @IBOutlet var txtFName: UITextField!
    
    @IBOutlet var vWSelectLang: UIView!
    @IBOutlet var vWEducation: UIView!
    
    @IBOutlet var txtEducation: UITextField!
    @IBOutlet var txtLocation: UITextField!
    @IBOutlet var vWLocation: UIView!
    @IBOutlet var txtDOB: UITextField!
    @IBOutlet var txtLName: UITextField!
    @IBOutlet var vWTitle: UIView!
    
    @IBOutlet var vWCareGiverBottom: UIView!
    
    @IBOutlet var cvcServicesView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        cvcServicesView.allowsMultipleSelection = true
        imagePicker.delegate = self
        pickerView.delegate = self
        scrollView.contentSize = CGSize(width:0, height: (vwCareGiverInfo.frame.height + vWTitle.frame.height  + vWCareGiverBottom.frame.height + cvcServicesView.frame.height))
        cvcServicesView?.allowsMultipleSelection = true
        cvcServicesView.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUI()
    {
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        btnLogout.shadow()
        txtFName.setBottomBorder()
        txtLName.setBottomBorder()
        txtDOB.setBottomBorder()
        vWSelectLang.setBottomBorderView()
        vWSelectAdd.setBottomBorderView()
        vWLocation.setBottomBorderView()
        vWEducation.setBottomBorderView()
    }
    
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnSelectEducationClick(_ sender: UIButton) {
        self.vWPicker.alpha = 0
        self.vWPicker.isHidden = false
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.3) {
            self.vWPicker.alpha = 1
        }
        vWPicker.isHidden = false
        pickerView.reloadAllComponents()
        
    }
    
    @IBAction func btnHidePickerView(_ sender: UIButton) {
        self.vWPicker.alpha = 0
        self.vWPicker.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.vWPicker.alpha = 1
        }
    }
    @IBAction func btnLogOutClick(_ sender: UIButton) {
        let vc = CategoryVC(nibName: "CategoryVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnSubmitClick(_ sender: Any) {
        let vc = ReferealVC(nibName: "ReferealVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnSelectLangClick(_ sender: Any) {
        self.vWPicker.alpha = 0
        self.vWPicker.isHidden = false
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.3) {
            self.vWPicker.alpha = 1
        }
        vWPicker.isHidden = false
        pickerView.reloadAllComponents()
    }
    @IBAction func btnAddClick(_ sender: UIButton) {
        self.vWPicker.alpha = 0
        self.vWPicker.isHidden = false
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.3) {
            self.vWPicker.alpha = 1
        }
        vWPicker.isHidden = false
        pickerView.reloadAllComponents()
    }
    @IBAction func btnPickImgClick(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func btnEducationClick(_ sender: UIButton) {
        self.vWPicker.alpha = 0
        self.vWPicker.isHidden = false
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.3) {
            self.vWPicker.alpha = 1
        }
        vWPicker.isHidden = false
        pickerView.reloadAllComponents()
    }
    
    //////////////////PickerView Methods/////////////////////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Data"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    //////////////////ImagePicker Methods/////////////////////////
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imgProfile.image = pickImage
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //////////////////Collection Methods/////////////////////////
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
        
        cvcServicesView.frame = CGRect(x: cvcServicesView.frame.origin.x, y: cvcServicesView.frame.origin.y, width: cvcServicesView.frame.width, height: (CGFloat(size) *  CGFloat(ceil(13/3)) + (items * CGFloat(ceil(13/3)))))
        scrollView.contentSize = CGSize(width:0, height: 5 + vwCareGiverInfo.frame.height + vWTitle.frame.height + vWCareGiverBottom.frame.height + cvcServicesView.frame.height + 50)
        vWCareGiverBottom.frame = CGRect(x: vWCareGiverBottom.frame.origin.x, y: (cvcServicesView.frame.origin.y + cvcServicesView.frame.height), width: vWCareGiverBottom.frame.width, height: vWCareGiverBottom.frame.height)
        return CGSize(width: size, height: size)
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
    
}

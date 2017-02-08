//
//  PatientEditProfile.swift
//  AssistCare
//
//  Created by LaNet on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PatientEditProfile: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var vwStatusBar: UIView!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var txtFname: UITextField!
    @IBOutlet var imgProfile: UIImageView!
    
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var vWAddress: UIView!
    @IBOutlet var txtLname: UITextField!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var vWTblHeader: UIView!
    @IBOutlet var vWSecond: UIView!
    @IBOutlet var vWTop: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var btnLogout: UIButton!
    @IBOutlet var vWFooter: UIView!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var cvcServices: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cvcServices.register(UINib(nibName: "CareServicesCell" ,bundle : nil), forCellWithReuseIdentifier: "CareServicesCell")

        tblView.register(UINib(nibName: "cellMedication", bundle: nil), forCellReuseIdentifier: "cellMedication")
        tblView.tableHeaderView = vWTblHeader
        tblView.tableFooterView = vWFooter
        setUpUI()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUI()
    }
    
    func setUpUI()
    {
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white

        btnLogout.shadow()
        txtFname.setBottomBorder()
        txtLname.setBottomBorder()
        vWAddress.setBottomBorderView()
        imgProfile.setRounded()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    
    ////////////////TableView Methods/////////////////////
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tblView.frame = CGRect(x: tblView.frame.origin.x, y: tblView.frame.origin.x, width: tblView.frame.width, height: (55 * 5) + 256)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMedication", for: indexPath) as! cellMedication
        cell.lbMedicationName.text = "Medication Name"
        cell.lbMedicationTime.text = "In the morning,after food"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    ///////////////CollectionView Methods/////////////////
    
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
        scrollView.contentSize = CGSize(width:0, height: 5 + vWTop.frame.height + vWSecond.frame.height + cvcServices.frame.height + tblView.frame.height + 50)
        tblView.frame = CGRect(x: tblView.frame.origin.x, y: (cvcServices.frame.origin.y + cvcServices.frame.height), width: tblView.frame.width, height: tblView.frame.height)
        
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
    

    
  
    @IBAction func btnAddMedicationRequireClick(_ sender: UIButton) {
        
        
    }
    
    @IBAction func btnLogoutClick(_ sender: Any) {
    }
    

    @IBAction func btnSaveClick(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

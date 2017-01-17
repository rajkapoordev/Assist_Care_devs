//
//  EditProfile.swift
//  AssistCareOnDemand
//
//  Created by LaNet on 1/16/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class EditProfile: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var btnNext: UIButton!
    @IBOutlet var vw1: UIView!
    
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
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true

          cvcServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")
//        self.cvcServices.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CareServicesCell")
        scrollView.contentSize = CGSize(width:0, height: 5 + vw1.frame.height + vw2.frame.height + cvcServices.frame.height + btnNext.frame.height + 100)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        // flow layout have all the important info like spacing, inset of collection view cell, fetch it to find out the attributes specified in xib file
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize()
        }
        
        // subtract section left/ right insets mentioned in xib view
        
        let widthAvailbleForAllItems =  (collectionView.frame.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right)
        
        // Suppose we have to create nColunmns
        // widthForOneItem achieved by sunbtracting item spacing if any
        
        let widthForOneItem = widthAvailbleForAllItems / CGFloat(3) - flowLayout.minimumInteritemSpacing
        
        
        // here height is mentioned in xib file or storyboard
        return CGSize(width: CGFloat(widthForOneItem), height: (flowLayout.itemSize.height))
    }
    

    
    
    
    
    
    @IBAction func nextClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}


//
//  EditProfileCareGiver.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class EditProfileCareGiver: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var vWPersonalInfo: UIView!
    
    @IBOutlet var vWTitle: UIView!
    
    @IBOutlet var vWBottom: UIView!
    @IBOutlet var cvcServicesView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width:0, height: (vWPersonalInfo.frame.height + vWTitle.frame.height + vWBottom.frame.height + cvcServicesView.frame.height))
        cvcServicesView?.allowsMultipleSelection = true
        cvcServicesView.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")

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
        //scrollView.contentSize = CGSize(width:0, height: 5 + vw1.frame.height + vw2.frame.height + cvcServicesView.frame.height + btnNext.frame.height + 100)
     //   btnNext.frame = CGRect(x: btnNext.frame.origin.x, y: (cvcServicesView.frame.origin.y + cvcServicesView.frame.height), width: btnNext.frame.width, height: btnNext.frame.height)
        
        return CGSize(width: size, height: size)
        
        
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

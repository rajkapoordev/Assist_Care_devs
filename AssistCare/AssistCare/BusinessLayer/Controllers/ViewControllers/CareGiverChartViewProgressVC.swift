//
//  CareGiverChartViewProgressVC.swift
//  AssistCare
//
//  Created by developer91 on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverChartViewProgressVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var lbProgessReport: UILabel!
    @IBOutlet var lbProgressUpdate: UILabel!
    @IBOutlet var imgProgressUpdate: UIImageView!
    @IBOutlet var lbServicesProvided: UILabel!
    @IBOutlet var btnAddServices: UIButton!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var lbNamePatient: UILabel!
    @IBOutlet var imgPatient: UIImageView!
    @IBOutlet var vwProgressUpdate: UIView!
    @IBOutlet var collServicesProvided: UICollectionView!
    @IBOutlet var vwInfo: UIView!
    @IBOutlet var vwNavigation: UIView!
    @IBOutlet var lbNavigation: UILabel!
    @IBOutlet var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        // Do any additional setup after loading the view.
    }
    
    func setInterface(){
        vwNavigation.backgroundColor = AppColor.redColor
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.collServicesProvided.delegate = self
        self.collServicesProvided.dataSource = self
        self.collServicesProvided.register(UINib(nibName: "CareServicesCell", bundle: nil), forCellWithReuseIdentifier: "CareServicesCell")
        imgPatient.layer.cornerRadius = imgPatient.bounds.size.width / 2
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        cell.vWServices.frame.size = CGSize(width: cell.frame.width , height: cell.frame.width )
        cell.vWMark.frame = cell.vWServices.frame
        cell.imgMark.frame = cell.vWServices.frame
        cell.vWMark.setRounded()
        cell.imgMark.setRounded()
        cell.vWServices.setRounded()
        
        collServicesProvided.frame = CGRect(x: self.collServicesProvided.frame.origin.x, y: self.collServicesProvided.frame.origin.y, width: self.collServicesProvided.bounds.size.width, height: collServicesProvided.contentSize.height)
        
        
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
        flowLayout.headerReferenceSize = CGSize(width: 320, height: 80)
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
        //let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        return CGSize(width: size, height: size)
    }


}

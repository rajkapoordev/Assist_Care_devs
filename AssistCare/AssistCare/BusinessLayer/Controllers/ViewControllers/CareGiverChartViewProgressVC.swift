//
//  CareGiverChartViewProgressVC.swift
//  AssistCare
//
//  Created by developer91 on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverChartViewProgressVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
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
    var name:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface(){
        vwNavigation.backgroundColor = AppColor.redColor
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.collServicesProvided.delegate = self
        self.collServicesProvided.dataSource = self
        self.collServicesProvided.register(UINib(nibName: "CareServicesCell", bundle: nil), forCellWithReuseIdentifier: "CareServicesCell")
        imgPatient.setRounded()
        self.tabBarController?.tabBar.isHidden = true
        lbProgessReport.text = "The table view is not reloaded after the move operation - UITableView trusts you to change the underlying model list accordingly. If you have a bug in your implementation, the UI will show the moved cell as moved by the user, but the data object will have a different order."
        lbProgessReport.frame = CGRect(x: self.lbProgessReport.frame.origin.x, y: self.lbProgessReport.frame.origin.y, width: self.lbProgessReport.bounds.size.width, height: heightForView(text: lbProgessReport.text!, font: lbProgessReport.font, width: self.lbProgessReport.bounds.size.width))
        
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
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
        let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
         collServicesProvided.frame = CGRect(x: collServicesProvided.frame.origin.x, y: collServicesProvided.frame.origin.y, width: collServicesProvided.frame.width, height: (CGFloat(size) *  CGFloat(ceil(5/3)) + (items * CGFloat(ceil(5/3)))))
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
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

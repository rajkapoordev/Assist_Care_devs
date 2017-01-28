//
//  DisplayReviewVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class DisplayReviewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    var index:IndexPath!
    var height = CGFloat()

    @IBOutlet var tableViewReviews: UITableView!
    @IBOutlet var collectionViewTabs: UICollectionView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
        // Do any additional setup after loading the view.
        self.collectionViewTabs.delegate = self
        self.collectionViewTabs.dataSource = self
        self.collectionViewTabs.register(UINib(nibName: "TabCell", bundle: nil), forCellWithReuseIdentifier: "cell_tab")
        self.tableViewReviews.delegate = self
        self.tableViewReviews.dataSource = self
        self.tableViewReviews.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")

        index = IndexPath(row: 0, section: 0)

    }
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Reviews"
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_tab", for: indexPath) as! TabCell

//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 15, height: 15)
//        cell.layer.shadowOpacity = 1

        if indexPath.item == 0{
            cell.lb_cellTab.text = "RECENT"
        }else if indexPath.item == 1{
            cell.lb_cellTab.text = "POSITIVE"
        }else if indexPath.item == 2{
            cell.lb_cellTab.text = "NEGATIVE"
        }
      
        if(indexPath == index){
            cell.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
            cell.lb_cellTab.textColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        }else{
            cell.backgroundColor = UIColor.clear
            cell.lb_cellTab.textColor = UIColor.gray
        }
       
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width/3),height:50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(indexPath != index){
            
            index = indexPath
            collectionView.reloadData()
            
        }else{
            
            index = IndexPath(row: 0, section: 0)
            collectionView.reloadData()
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        let width = cell.imgUser.frame.size.width
        cell.imgUser.layer.cornerRadius = width/2
        if cell.lblReviewTxt.text != nil{
            height = heightForView(text: cell.lblReviewTxt.text!, font: cell.lblReviewTxt.font, width: cell.lblReviewTxt.frame.size.width)
        }else{
            height = 50
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // let height = self.calculateSize(self.arrList[indexPath.row] as! String)
        
        return height + 90
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBackClicked(_ sender: Any) {
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

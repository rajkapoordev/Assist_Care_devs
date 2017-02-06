//
//  DisplayReviewVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class DisplayReviewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    var index:IndexPath!
    var height = CGFloat()

    @IBOutlet var vwCollectionView: UIView!
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
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Reviews"
        self.tabBarController?.tabBar.isHidden = true
        
        vwCollectionView.layer.shadowColor = UIColor.darkGray.cgColor
        vwCollectionView.layer.shadowOffset = CGSize(width: 1.0, height: 5.0)
        vwCollectionView.layer.shadowOpacity = 0.5
        vwCollectionView.layer.masksToBounds = false
        //vwCollectionView.layer.shadowColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1).cgColor
        //vwCollectionView.layer.shadowRadius = 100

    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_tab", for: indexPath) as! TabCell


        if indexPath.item == 0{
            cell.lb_cellTab.text = "RECENT"
        }else if indexPath.item == 1{
            cell.lb_cellTab.text = "POSITIVE"
        }else if indexPath.item == 2{
            cell.lb_cellTab.text = "NEGATIVE"
        }
      
        if(indexPath == index){
            cell.backgroundColor = AppColor.skyColor
            cell.lb_cellTab.textColor = AppColor.skyColor
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
        self.navigationController!.popViewController(animated: true)
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

//
//  CreateProfileSecond.swift
//  AssistCare
//
//  Created by LaNet on 1/20/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileSecond: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var vWHeader: UIView!
    @IBOutlet var tblView: UITableView!
    var headerTitle = NSMutableArray()
    var isArrExpand = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeaderValue()
        
        
        tblView.register(UINib(nibName: "CirtificateCell", bundle: nil), forCellReuseIdentifier: "CirtificateCell")

        // Do any additional setup after loading the view.
    }
    
    func setHeaderValue()
    {
        
        headerTitle.add("Personal Info")
        headerTitle.add("Academic")
        headerTitle.add("Interested Area")
        for var j in 0..<headerTitle.count
        {
            isArrExpand.add(false)
        }
//        isArrExpand = headerTitle.map({ value in
//        return false
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return headerTitle.count
       // return 1

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (isArrExpand[section] as! Bool == true)
        {
            return 5
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CirtificateCell", for: indexPath) as! CirtificateCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1
        {
            return 43
        }
        return 152
    }
//
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200.0
//    }
//    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "First section header title"
//    }
//    
    
//
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        headerView.clipsToBounds = true
        // headerView.layer.cornerRadius = 10
        headerView.backgroundColor = UIColor.red
        
        let img = UIImageView()
        img.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
        headerView.addSubview(img)
        
        let lbtitle = UILabel()
        lbtitle.frame = CGRect(x: 60, y: 5, width: ScreenSize.SCREEN_WIDTH/2, height: CGFloat(20))
        lbtitle.numberOfLines = 0
        lbtitle.text = "Hello"
        lbtitle.text = headerTitle[section] as? String
        
        let lblSubDescription = UILabel()
        lblSubDescription.frame = CGRect(x: 60, y:lbtitle.frame.origin.y + lbtitle.frame.height , width: ScreenSize.SCREEN_WIDTH/2, height: 20)
        lblSubDescription.text = headerTitle[section] as? String
        headerView.addSubview(lblSubDescription)
        
        
        headerView.addSubview(lbtitle)
        let imgArrow = UIImageView()
        imgArrow.frame = CGRect(x: ScreenSize.SCREEN_WIDTH - 50, y: 5, width: 20, height: 20)
        if (isArrExpand[section] as! Bool)
        {
            imgArrow.image = UIImage(named:"Arrow_Up")
        }
        else{
            imgArrow.image = UIImage(named:"Arrow")
        }
        let btnClick = UIButton()
        btnClick.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 40)
        
        btnClick.backgroundColor = UIColor.clear
        btnClick.addTarget(self, action: #selector(CreateProfileSecond.btnClick(sender:)), for: .touchUpInside)
        btnClick.tag = section
        headerView.addSubview(imgArrow)
        headerView.addSubview(btnClick)
        return headerView


    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func btnClick(sender:UIButton)
    {
        let isExp = isArrExpand[sender.tag] as! Bool
        isArrExpand.replaceObject(at: sender.tag, with: !isExp)
        //isArrExpand[sender.tag] = !isExp
        let indexSet = NSIndexSet(index: sender.tag)
        tblView.reloadSections(indexSet as IndexSet, with: .fade)

        
    
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

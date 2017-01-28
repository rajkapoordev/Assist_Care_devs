//
//  CreateProfileThird.swift
//  AssistCare
//
//  Created by LaNet on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileThird: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var vWPicker: UITableView!
    @IBOutlet var tblView: UITableView!
    var customView = UIView()
    var headerTitle = NSMutableArray()
    var isArrExpand = NSMutableArray()
    var reference = NSMutableArray()
    var subTitle = NSMutableArray()
    var status = ["Yes","No"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        addCustomeView()
        tblView.tableFooterView = customView
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    func addCustomeView()
    {
        customView.frame = CGRect(x: 5, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 50)
        // customView.backgroundColor = UIColor.red
        
        
        let previous = UIButton(frame: CGRect(x: 20, y: 0, width: ScreenSize.SCREEN_WIDTH/2 - 30 , height: 40))
        previous.setTitle("Previous", for: .normal)
        previous.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        
        let Next = UIButton(frame: CGRect(x: ScreenSize.SCREEN_WIDTH/2 + 10 , y: 0, width: ScreenSize.SCREEN_WIDTH/2 - 30, height: 40))
        Next.setTitle("Next", for: .normal)
        Next.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        previous.backgroundColor = UIColor.brown
        Next.backgroundColor = UIColor.black
        previous.shadow()
        Next.shadow()
        customView.addSubview(previous)
        customView.addSubview(Next)
    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    func nextAction()
    {
        let vc = CreateProfileFour(nibName: "CreateProfileFour", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    func previousAction(sender: UIButton!) {
        print("Button tapped")
    }
        
    func setValue()
    {
        
        headerTitle.add("Reference(required)")
        headerTitle.add("Police Clearancee")
        headerTitle.add("First Aid Certificate")
      
        
        subTitle.add("")
        subTitle.add("Required for All Services")
        subTitle.add("Required for All Services")
        
        reference.add("Reference1")
        reference.add("Reference2")
        
        
        for var j in 0..<headerTitle.count
        {
            isArrExpand.add(true)
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnDoneClick(_ sender: Any) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isArrExpand[section] as! Bool == true)
        {
            if section == 0
            {
              return  reference.count
            }
            return 1
            
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
        tableView.register(UINib(nibName : "ReferenceCell", bundle : nil), forCellReuseIdentifier: "ReferenceCell")
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReferenceCell", for: indexPath) as! ReferenceCell
        cell.lblTitle.text = reference[indexPath.row] as! String
        return cell
        }
        else
        {
            tableView.register(UINib(nibName : "CirtificateCell", bundle : nil), forCellReuseIdentifier: "CirtificateCell")
            var cell = tableView.dequeueReusableCell(withIdentifier: "CirtificateCell", for: indexPath) as! CirtificateCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 0
        {
           return 152
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        headerView.clipsToBounds = true
        // headerView.layer.cornerRadius = 10
        headerView.backgroundColor = UIColor.white
        
        let img = UIImageView()
        img.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
        img.image = UIImage(named:"Degree.png")
        headerView.addSubview(img)
        
        let lbtitle = UILabel()
        lbtitle.frame = CGRect(x: 60, y: 5, width: ScreenSize.SCREEN_WIDTH/2 + 50, height: CGFloat(20))
        lbtitle.font = lbtitle.font.withSize(14)
        lbtitle.numberOfLines = 0
        // lbtitle.backgroundColor = UIColor.blue
        lbtitle.text = "Hello"
        lbtitle.text = headerTitle[section] as? String
        
        let lblSubDescription = UILabel()
        lblSubDescription.frame = CGRect(x: 60, y:lbtitle.frame.origin.y + lbtitle.frame.height , width: ScreenSize.SCREEN_WIDTH/2 + 50, height: 20)
        lblSubDescription.font = lblSubDescription.font.withSize(10)
        //lblSubDescription.font = UIFont(name: "System", size: 5)
        lblSubDescription.text = subTitle[section] as? String
        headerView.addSubview(lblSubDescription)
        
        
        headerView.addSubview(lbtitle)
        let imgArrow = UIImageView()
        imgArrow.frame = CGRect(x: ScreenSize.SCREEN_WIDTH - 40, y: 5, width: 20, height: 20)
        if (isArrExpand[section] as! Bool)
        {
            imgArrow.image = UIImage(named:"Checked.png")
        }
        else{
            imgArrow.image = UIImage(named:"Unchecked.png")
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
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        
        if section == 0
        {
        
        footerView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        footerView.clipsToBounds = true
        // headerView.layer.cornerRadius = 10
        footerView.backgroundColor = UIColor.white
        
        let img = UIImageView()
        img.frame = CGRect(x: 50, y: 5, width: 25, height: 25)
        img.image = UIImage(named:"plus.png")
        footerView.addSubview(img)
        
        let lbtitle = UILabel()
        lbtitle.frame = CGRect(x: 80, y: 5, width: ScreenSize.SCREEN_WIDTH/2, height: CGFloat(20))
        lbtitle.font = lbtitle.font.withSize(14)
        lbtitle.numberOfLines = 0
        // lbtitle.backgroundColor = UIColor.blue
        lbtitle.text = "Add another reference"
        footerView.addSubview(lbtitle)
            
            
            let btnAddReference = UIButton()
            btnAddReference.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 40)
            
            btnAddReference.backgroundColor = UIColor.clear
            btnAddReference.addTarget(self, action: #selector(addReferenceClick(sender:)), for: .touchUpInside)
            btnAddReference.tag = section
            footerView.addSubview(btnAddReference)
        }
        return footerView
        
    }
    
    func addReferenceClick(sender:UIButton)
    {
//        let isExp = isArrExpand[sender.tag] as! Bool
//        isArrExpand.replaceObject(at: sender.tag, with: !isExp)
//        //isArrExpand[sender.tag] = !isExp
        let val = "Reference" + " " + String((reference.count + 1))
        reference.add(val)
        let indexSet = NSIndexSet(index: sender.tag)
        tblView.reloadSections(indexSet as IndexSet, with: .fade)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 55
        }
        else
        {
            return 0
        }
    }
    
    
    func btnClick(sender:UIButton)
    {
        let isExp = isArrExpand[sender.tag] as! Bool
        isArrExpand.replaceObject(at: sender.tag, with: !isExp)
        //isArrExpand[sender.tag] = !isExp
       
        let indexSet = NSIndexSet(index: sender.tag)
        tblView.reloadSections(indexSet as IndexSet, with: .fade)
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "data"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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

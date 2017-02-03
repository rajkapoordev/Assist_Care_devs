//
//  CarePlanVC.swift
//  AssistCare
//
//  Created by LaNet on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CarePlanVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tblView: UITableView!
    var customView = UIView()
    var headerTitle = NSMutableArray()
    var isArrExpand = NSMutableArray()
    var reference = NSMutableArray()
    var subTitle = NSMutableArray()
    var str = "The table view is not reloaded after the move operation - UITableView trusts you to change the underlying model list accordingly. If you have a bug in your implementation, the UI will show the moved cell as moved by the user, but the data object will have a different order. To check for the correctness of your implementation, use NSLog or reload the table after the move "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        addCustomeView()
        tblView.tableFooterView = customView
        


        // Do any additional setup after loading the view.
    }
    
    func setValue()
    {
        
        headerTitle.add("Meal Preparation")
        headerTitle.add("Medication Prompt")
        headerTitle.add("Patient Progress")
        subTitle.add("Meal preparation instructions")
        subTitle.add("Medication administration insructions")
        subTitle.add("Notes from past visits")
        for _ in 0..<headerTitle.count
        {
            isArrExpand.add(false)
        }
        
    }

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isArrExpand[section] as! Bool == true)
        {
           
            return 1
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1
        {
            tblView.register(UINib(nibName:"MedicationPrompt",bundle : nil), forCellReuseIdentifier: "MedicationPrompt")
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationPrompt", for: indexPath) as! MedicationPrompt
//            cell.lblDescription.text = str
//            cell.lblDescription.numberOfLines = 0
//            cell.lblDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
//            cell.lblDescription.sizeToFit()
            return cell

        }
        else
        {
            tblView.register(UINib(nibName:"MealPreparation",bundle : nil), forCellReuseIdentifier: "MealPreparation")
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealPreparation", for: indexPath) as! MealPreparation
            cell.lblDescription.text = str
            cell.lblDescription.numberOfLines = 0
            cell.lblDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.lblDescription.sizeToFit()
        return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath.section == 1{
        return 100
     }else{
        return str.height(constraintedWidth: tableView.frame.size.width, font: UIFont.systemFont(ofSize: 15))
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        headerView.clipsToBounds = true
        headerView.backgroundColor = UIColor.white
        let lbtitle = UILabel()
        lbtitle.frame = CGRect(x: 10, y: 5, width: ScreenSize.SCREEN_WIDTH/2 + 50, height: CGFloat(20))
        lbtitle.font = lbtitle.font.withSize(14)
        lbtitle.numberOfLines = 0
        // lbtitle.backgroundColor = UIColor.blue
        lbtitle.text = "Hello"
        lbtitle.text = headerTitle[section] as? String
        
        let lblSubDescription = UILabel()
        lblSubDescription.frame = CGRect(x: 10, y:lbtitle.frame.origin.y + lbtitle.frame.height , width: ScreenSize.SCREEN_WIDTH/2 + 50, height: 20)
        lblSubDescription.font = lblSubDescription.font.withSize(10)
        
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
    
    

    func btnClick(sender:UIButton)
    {
        let isExp = isArrExpand[sender.tag] as! Bool
        isArrExpand.replaceObject(at: sender.tag, with: !isExp)
        //isArrExpand[sender.tag] = !isExp
        
        let indexSet = NSIndexSet(index: sender.tag)
        tblView.reloadSections(indexSet as IndexSet, with: .fade)
        
        
        
    }
    
    func addCustomeView()
    {
        customView.frame = CGRect(x: 0, y: 20, width: ScreenSize.SCREEN_WIDTH, height: 50)
        // customView.backgroundColor = UIColor.red
        
        
        let btnEndServiceEarly = UIButton(frame: CGRect(x: 30, y: 0, width: customView.frame.width - 60 , height: 40))
        btnEndServiceEarly.setTitle("END SERVICE EARLY", for: .normal)
        btnEndServiceEarly.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        btnEndServiceEarly.titleLabel?.textColor = UIColor.red
        btnEndServiceEarly.backgroundColor = UIColor.blue
        btnEndServiceEarly.shadow()
        customView.addSubview(btnEndServiceEarly)
        
    }
    
    func nextClick()
    {
        let vc = CreateProfileFour(nibName: "CreateProfileFour", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }
}


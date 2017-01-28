//
//  CreateProfileSecond.swift
//  AssistCare
//
//  Created by LaNet on 1/20/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileSecond: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet var scrollView: UIScrollView!
    var customView = UIView()
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var vWHeader: UIView!
    @IBOutlet var tblView: UITableView!
    var headerTitle = NSMutableArray()
    var isArrExpand = NSMutableArray()
    var subTitle = NSMutableArray()
    var status = ["Yes","No"]
    @IBOutlet var vWDone: UIView!
    @IBOutlet var vWPicker: UIView!
    var selectedStatus = ""
    let imagePicker = UIImagePickerController()
    @IBOutlet var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        setHeaderValue()
        pickerView.delegate = self
        customView.frame = CGRect(x: 5, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 50)
       // customView.backgroundColor = UIColor.red
        
        
        let previous = UIButton(frame: CGRect(x: 20, y: 0, width: ScreenSize.SCREEN_WIDTH/2 - 30 , height: 40))
        previous.setTitle("Previous", for: .normal)
        previous.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        let Next = UIButton(frame: CGRect(x: ScreenSize.SCREEN_WIDTH/2 + 10 , y: 0, width: ScreenSize.SCREEN_WIDTH/2 - 30, height: 40))
        Next.setTitle("Next", for: .normal)
        Next.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        previous.backgroundColor = UIColor.brown
        Next.backgroundColor = UIColor.black
        previous.shadow()
        Next.shadow()
        customView.addSubview(previous)
        customView.addSubview(Next)

        tblView.register(UINib(nibName: "CirtificateCell", bundle: nil), forCellReuseIdentifier: "CirtificateCell")
        tblView.tableFooterView = customView
        
        // Do any additional setup after loading the view.
    }
    
    func nextAction()
    {
        let vc = CareServicesVC(nibName: "CareServicesVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)

    
    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
       

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return status.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
//        var data = ""
//        
//        if(tag == 0){
//            
//            data = languages[row]
//            
//        }else{
//            
//            data = add[row]
//            
//        }
//        
        return status[row]
        
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedStatus = status[row]
//        
//        if(tag == 0){
//            
//            
//            
//            btnLanguage.setTitle(languages[row], for: .normal)
//            
//        }else{
//            
//            
//            
//            btnAdd.setTitle(add[row], for: .normal)
//            
//        }
        
    }
    


    
    
    
    
    @IBAction func btnDoneClick(_ sender: Any) {
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }

    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    
    func setHeaderValue()
    {
        
        headerTitle.add("Bachelor og Nursing")
        headerTitle.add("Certificate III in Aged Care")
        headerTitle.add("Working With Children Check")
        headerTitle.add("Hoist Training")
        headerTitle.add("Handling Medications Training")
        headerTitle.add("Other Certifications")
        
        subTitle.add("Optional Certification")
        subTitle.add("Only required for <Whatever it's required for>")
        subTitle.add("Only require to work with patients under 18")
        subTitle.add("Only required for hoist transfers service")
        subTitle.add("Only require to administer medication")
        subTitle.add("Specify any other relevant certifications")
        



        for var j in 0..<headerTitle.count
        {
            isArrExpand.add(true)
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
            return 1
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 5
        {
            
            tblView.register(UINib(nibName: "OtherCertificateCell", bundle: nil), forCellReuseIdentifier: "OtherCertificateCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherCertificateCell", for: indexPath) as! OtherCertificateCell
            cell.btnStatus.addTarget(self,  action: #selector(pickStatus), for: .touchUpInside)
            cell.btnStatus.tag = indexPath.row
            return cell
        }
        else
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CirtificateCell", for: indexPath) as! CirtificateCell
        cell.btnStatus.addTarget(self,  action: #selector(pickStatus), for: .touchUpInside)
           cell.btnImgPicker.addTarget(self,  action: #selector(pickImg), for: .touchUpInside)
            cell.btnStatus.tag = indexPath.row
        return cell
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let data = UIImagePNGRepresentation(pickedImage) as NSData?
            //print(data)

        }
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    func getArrayOfBytesFromImage(imageData:NSData) -> NSMutableArray
    {
        
        // the number of elements:
        let count = imageData.length / MemoryLayout<UInt8>.size
        
        // create array of appropriate length:
        var bytes = [UInt8](repeating: 0, count: count)
        
        // copy bytes into array
        imageData.getBytes(&bytes, length:count * MemoryLayout<UInt8>.size)
        
        var byteArray:NSMutableArray = NSMutableArray()
        
//        for var j in 0..<headerTitle.count
//        {
        for var i in 0 ..< count
        {
            byteArray.add(NSNumber(value: bytes[i]))
        }
        
        return byteArray
        
        
    }
    func pickImg(sender : UIButton)
    {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    
    }
    
    func pickStatus(sender : UIButton)
    {
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        
        
        
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }
        
        sender.setTitle(selectedStatus, for: .normal)
        
        vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        

    
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5
        {
            return 250
        }
        return 152
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 55
//    }
    
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

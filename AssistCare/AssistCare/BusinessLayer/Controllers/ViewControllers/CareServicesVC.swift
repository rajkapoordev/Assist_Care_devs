


class CareServicesVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var vwStatusBar: UIView!

    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var vWLanguage: UIView!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var vWTop: UIView!
    
    @IBOutlet var btnLanguage: UIButton!
    
    @IBOutlet var vWadd: UIView!
    
    @IBOutlet var vWPicker: UIView!
    
    @IBOutlet var btnNext: UIButton!
    
    @IBOutlet var btnAdd: UIButton!
    
    @IBOutlet var btnPrevious: UIButton!
    
    @IBOutlet var vWBottom: UIView!
    
    @IBOutlet var cvcCareServices: UICollectionView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    var languages = ["English","Japani","China","Hindi"]
    
    var add = ["one","two","three"]
    
    var isOpened:Bool = false
    
    var btnTemp:UIButton!
    
    var tag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        pickerView.delegate = self
        self.vWLanguage.setBottomBorderView()
        vWadd.setBottomBorderView()
        btnNext.shadow()
        btnPrevious.shadow()
        cvcCareServices?.allowsMultipleSelection = true
        cvcCareServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")
       
        scrollView.contentSize = CGSize(width:0, height: 5 + vWTop.frame.height + vWTop.frame.height + cvcCareServices.frame.height + btnNext.frame.height + 100 + vWBottom.frame.height)
        let defaults = UserDefaults.standard
        let page = defaults.value(forKey: "UserRole") as! String
        if !(page == "Care Giver"){
            lblNavTitle.text = "Create Profile"
        }
        
        btnNext.backgroundColor = AppColor.skyColor
        btnPrevious.backgroundColor = AppColor.darkBlueColor

    }
    
    @IBAction func btnBackClick(_ sender: UIButton) {
      self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNextClick(_ sender: Any) {
        let vc = CreateProfileThird(nibName: "CreateProfileThird", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func btnLanguageClick(_ sender: Any) {
        
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        
        
        
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }
        
        tag = 0
        
        vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        
        
        
    }
    
    
    
    @IBAction func btnAddClick(_ sender: Any) {
        
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        
        
        
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }
        
        tag = 1
        
        vWPicker.isHidden = false
        
        pickerView.reloadAllComponents()
        
    }
    
    
    
    
    
    @IBAction func btnPreviousClick(_ sender: Any) {
        
        
    }
    
    
    
    @IBOutlet var btnNextClick: UIButton!
    
    
    
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
        
        
        
        cvcCareServices.frame = CGRect(x: cvcCareServices.frame.origin.x, y: cvcCareServices.frame.origin.y, width: cvcCareServices.frame.width, height: (CGFloat(size) *  CGFloat(ceil(13/3)) + (items * CGFloat(ceil(13/3)))))
        
        scrollView.contentSize = CGSize(width:0, height: 5 + vWTop.frame.height + vWBottom.frame.height + cvcCareServices.frame.height + 100)
        
        vWBottom.frame = CGRect(x: vWBottom.frame.origin.x, y: (cvcCareServices.frame.origin.y + cvcCareServices.frame.height), width: vWBottom.frame.width, height: vWBottom.frame.height)
        
        
        
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        
        
        
        
        
        selectedCell.vWMark.isHidden = true
        
        selectedCell.imgMark.isHidden = true
        
        
        
    }
    
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var count = 0
        
        if(tag == 0){
            
            count = languages.count
            
        }else{
            
            count = add.count
            
        }
        
        return count
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var data = ""
        
        if(tag == 0){
            
            data = languages[row]
            
        }else{
            
            data = add[row]
            
        }
        
        return data
        
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if(tag == 0){
            
            
            
            btnLanguage.setTitle(languages[row], for: .normal)
            
        }else{
            
            
            
            btnAdd.setTitle(add[row], for: .normal)
            
        }
        
    }
    
    
    
    @IBAction func btnDoneClick(_ sender: Any) {
        
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func btnCancelClick(_ sender: Any) {
        
        self.vWPicker.alpha = 0
        
        self.vWPicker.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            
            self.vWPicker.alpha = 1
            
        }
        
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

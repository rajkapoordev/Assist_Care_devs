//
//  SearchResultVC.swift
//  MapkitDmo
//
//  Created by LaNet on 2/1/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
class SearchResultVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var vwStatusBar: UIView!
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil

    @IBOutlet var tblView: UITableView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        tblView.delegate = self
        tblView.dataSource = self
        self.tabBarController?.tabBar.isHidden = true
        // tblView.register(UINib(nibName:"TblCell",bundle : nil ), forCellReuseIdentifier: "TblCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)

    }
    
}


extension SearchResultVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.tblView.reloadData()
        }
    }
}



extension SearchResultVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.register(UINib(nibName:"SearchResultCell",bundle : nil ), forCellReuseIdentifier: "SearchResultCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell")! as! SearchResultCell
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.lblTitle.text = selectedItem.name
        cell.lblSubTitle.text = parseAddress(selectedItem: selectedItem)
        cell.imgPin.image = UIImage(named: "placeholder.png")

      //   cell.lblTitle.text = selectedItem.name
       // cell.detailTextLabel?.text = ""
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
}


//
//  MapAnnotation.swift
//  AssistCare
//
//  Created by LaNet on 1/19/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
class MapAnnotation: NSObject, MKAnnotation {
    private let titl: String
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.titl = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    private var subtitl: String {
        return locationName
    }
}

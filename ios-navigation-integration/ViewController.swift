//
//  ViewController.swift
//  ios-navigation-integration
//
//  Created by Emre Kuru on 19.08.2021.
//

import UIKit
import PoilabsNavigation

class ViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    var currentCarrier: PLNNavigationMapView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        // Do any additional setup after loading the view.
    }

    func loadMap() {
        let settings = PLNNavigationSettings.sharedInstance()
        settings?.applicationId = "APPLICATION_ID"
        settings?.applicationSecret = "APPLICATION_SECRET_KEY"
        settings?.navigationUniqueIdentifier = "UNIQUE_ID"
        // Supported languages: en, tr, hr, ar, de, ru, pl
        settings?.applicationLanguage = "en"

        //Using custom user location icon
        //settings?.customUserIcon = UIImage(named: "userLocation")
        
        
        //Start with active compass mode
        //settings?.isCompassActive = true
        
        PLNavigationManager.sharedInstance()?.getReadyForStoreMap(completionHandler: { (error) in
            if error == nil {
                let carrierView = PLNNavigationMapView(frame: CGRect(x: 0, y: 0, width: self.navigationView.bounds.size.width, height: self.navigationView.bounds.size.height))
                carrierView.awakeFromNib()
                carrierView.delegate = self
                self.currentCarrier = carrierView
                self.navigationView.addSubview(carrierView)
            } else {
                //show error
            }
        })
    }

}

extension ViewController: PLNNavigationMapViewDelegate {
    func childsAreReady() {
//        Showing location pin on map
//        self.currentCarrier?.getShowonMapPin("store_id")
        
        
//        Showing multiple pins on map
//        self.currentCarrier?.showMultiplePins(["store_id1", "store_id2", "store_id3"])
        
//        Getting route on map
//        self.currentCarrier?.navigateWithStoreId(to: "store_id")
    }
}

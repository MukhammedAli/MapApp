//
//  ViewController.swift
//  MapApp
//
//  Created by  Mukhammed Ali Khamzayev on 17.08.2023.
//

import UIKit
import MapKit
import SnapKit

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    
    
    lazy var mapView: MKMapView = {
       let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        searchTextField.backgroundColor = UIColor.white
        searchTextField.placeholder = "Search"
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftViewMode = .always
        return searchTextField
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize location manager
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestLocation()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(mapView)
        view.bringSubviewToFront(searchTextField)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        //add constraints to searchMap
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.centerX.equalTo(view.center)
            $0.width.equalTo(view.bounds.size.width/1.2)
            $0.top.equalToSuperview().inset(60)
            
        }
        //add constraints to map
        mapView.snp.makeConstraints {
            $0.centerX.equalTo(view.center)
            $0.centerY.equalTo(view.center)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager,
              let location = locationManager.location else { return }
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region  = MKCoordinateRegion(center: location.coordinate , latitudinalMeters: 750, longitudinalMeters: 750)
            mapView.setRegion( region, animated: true)
        case .denied:
            print("")
        case .notDetermined, .restricted:
            print("")
        @unknown default:
            print("")
        }
                
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        <#code#>
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

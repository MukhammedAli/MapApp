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
    
    lazy var mapView: MKMapView = {
       let map = MKMapView()
        //map.showsUserLocation = true
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


}


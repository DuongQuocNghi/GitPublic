//
//  GYMCollectionViewCell.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/3/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit
import GoogleMaps

class GYMCollectionViewCell: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , CLLocationManagerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phongTapList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var x = phongTapList?[indexPath.row]
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhongTapViewCell", for: indexPath) as! PhongTapViewCell
        
        cell.Hinh.image = UIImage(named: (x?.hinh)!)
        cell.Ten.text = x?.ten
        cell.DanhGia.text = String((x?.danhGia)!)
        cell.DiaChi.text = x?.diaChi
        cell.ThoiGia.text = x?.gioMoCua
        cell.StartDanhGia.text =  "★★★★☆"
        
        return cell
    }
    
    @IBOutlet weak var mapView: GMSMapView!
    var phongTapUtils : PhongTapUtils?
    var phongTapList : [PhongTap]?
    var locationManager : CLLocationManager?
    var currentLocation : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phongTapUtils = PhongTapUtils(context: (UIApplication.shared.delegate as! AppDelegate).persistentContraner.viewContext)
        
        phongTapList = phongTapUtils?.getAll()
        
        initMap()
        addMarkerListPhongTap()
    }
    
    func addMarkerListPhongTap() {
        phongTapList?.forEach({ x in
            let marker = GMSMarker()
            marker.icon = phongTapUtils?.xeoLoai(diem: x.danhGia)
            marker.position = CLLocationCoordinate2D(latitude: x.lat, longitude: x.long)
            marker.title = x.ten
            marker.snippet = x.soDienThoai
            marker.map = mapView
        })
    }
    
    func initMap(){
//        let camera = GMSCameraPosition.camera(withLatitude: 10.773040, longitude: 106.689248, zoom: 16.0)
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView?.settings.myLocationButton = true;
//        mapView?.isMyLocationEnabled = true;
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
        
        let location : CLLocation? = locations.last

        print(location)
        
        let camera = GMSCameraPosition.camera(withLatitude: location?.coordinate.latitude ?? 0, longitude: location?.coordinate.longitude ?? 0, zoom: 16)
        
        mapView?.animate(to: camera)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
            break;
        case .authorizedWhenInUse:
            print("Permission OK")
            break;
        default:
            print("Permission Error \(status)")
            break;
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func mapOnClick(_ sender: Any) {
        if mapView != nil{
            mapView.isHidden = !mapView.isHidden
        }
    }
}

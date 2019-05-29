//
//  SanPhamModel.swift
//  OderApp
//
//  Created by ADMIN on 5/27/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation
import UIKit

public class SanPhamModel {
    var GiaTien :Double?
    var Ten : String?
    var Mota : String?
    var Hinh : String?
    var Loai : Loai?
    
    init(_ name:String, _ gia:Double, _ moTa:String, _ hinhAnh:String) {
        self.Ten = name
        self.GiaTien = gia
        self.Mota = moTa
        self.Hinh = hinhAnh
    }
    
    func GiaKhuyenMai() -> Double? {
        if GiaTien == nil{
            return nil
        }
        return GiaTien!*0.8
    }
    
    public enum Loai {
        case Tra
        case Cafe
    }
    
    func getUIImage() -> UIImage? {
        let catPictureURL = URL(string: Hinh!)!
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        
        downloadPicTask.resume()
        
        return nil
    }
}

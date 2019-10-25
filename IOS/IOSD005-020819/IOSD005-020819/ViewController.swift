//
//  ViewController.swift
//  IOSD005-020819
//
//  Created by ADMIN on 8/2/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hinh: UIImageView!
    @IBOutlet weak var TrangThai: UILabel!
    @IBOutlet weak var diem: UILabel!
    @IBOutlet weak var daoDien: UILabel!
    @IBOutlet weak var QuocGia: UILabel!
    @IBOutlet weak var nam: UILabel!
    @IBOutlet weak var ngayRaRap: UILabel!
    @IBOutlet weak var thoiLuong: UILabel!
    @IBOutlet weak var chatLuong: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestThongTinPhim(urlPhim: "http://5d443f4ad823c300147714eb.mockapi.io/GetChiTietPhim"){ x in
            
        }
    }

    func requestThongTinPhim(urlPhim:String,calBack: (Phim)->Void) {
//        http://5d443f4ad823c300147714eb.mockapi.io/GetChiTietPhim
        var urlRequest = URLRequest(url: URL(string: urlPhim)!)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print(response)
        }
        task.resume()
    }
    
}
class Phim {
    var HinhUrl : String?
    var TrangThai : String?
    var diem : Float?
    var daoDien : String?
    var QuocGia : String?
    var Video : String?
    var nam : Int?
    var ngayRaRap : String?
    var thoiLuong : Int?
    var chatLuong : String?
}

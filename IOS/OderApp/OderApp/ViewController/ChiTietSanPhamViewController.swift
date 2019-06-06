//
//  ChiTietSanPhamViewController.swift
//  OderApp
//
//  Created by ADMIN on 6/3/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ChiTietSanPhamViewController: UIViewController {

    @IBOutlet weak var Hinh: UIImageView!
    @IBOutlet weak var Ten: UILabel!
    @IBOutlet weak var MoTa: UILabel!
    @IBOutlet weak var SoLuong: UILabel!
    @IBOutlet weak var Gia: UILabel!
    
    @IBOutlet weak var SizeNho: UIButton!
    @IBOutlet weak var SizeVua: UIButton!
    @IBOutlet weak var SizeLon: UIButton!
    
    var Size = SizeSanPham.Vua
    var Data : SanPhamModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SoLuong.text = "1"
        SetSize(size: .Lon)
        UpdateGia()
        SetupData()
        
        if Data is SPNuocModel{
            Data = Data as? SPNuocModel
            SizeNho.setTitle("200ml", for: .normal)
            SizeVua.setTitle("500ml", for: .normal)
            SizeLon.setTitle("1000ml", for: .normal)
        } else if Data is SPThucAnModel{
            Data = Data as? SPThucAnModel
        }
        // Do any additional setup after loading the view.
    }
    
    func SetupData() {
        Hinh.image = UIImage(named: (Data?.Hinh)!)
        Ten.text = Data?.Ten
        MoTa.text = Data?.Mota
    }
    
    @IBAction func actSizeNho(_ sender: Any) {
        SetSize(size: .Nho)
        UpdateGia()
    }
    @IBAction func actSizeVua(_ sender: Any) {
        SetSize(size: .Vua)
        UpdateGia()
    }
    @IBAction func actSizeLon(_ sender: Any) {
        SetSize(size: .Lon)
        UpdateGia()
    }
    @IBAction func actGiamSL(_ sender: Any) {
        SetSoLuong(key: 0)
        UpdateGia()
    }
    @IBAction func actTangSL(_ sender: Any) {
        SetSoLuong(key: 1)
        UpdateGia()
    }
    @IBAction func actChiaSe(_ sender: Any) {
    }
    
    @IBAction func actAdd(_ sender: Any) {
        print("\((Data?.Ten)!) - \(Gia.text!) - \(SoLuong.text!) - \(Size)")
        dismiss(animated: true, completion: nil)
    }
    
    func UpdateGia() {
        var gia = Data!.GiaTien!
        switch Size {
        case .Lon:
            gia += Double(20000)
            break
        case .Vua:
            gia += Double(10000)
            break
        case .Nho:
            
            break
        }
        Gia.text = "\(gia*Double(SoLuong.text!)!) đồng"
    }
    
    func SetSoLuong(key:Int ) {
        var sl = Int(SoLuong.text!)!
        
        switch key {
        case 0:
            if sl > 1{
                sl -= 1
            }
            break
        case 1:
            if sl < 10{
                sl += 1
            }
            break
        default: break
        
        }
        SoLuong.text = String(sl)
        
    }
    
    func SetSize(size: SizeSanPham) {
        Size = size
        SizeVua.backgroundColor = UIColor.white
        SizeLon.backgroundColor = UIColor.white
        SizeNho.backgroundColor = UIColor.white
        switch size {
        case .Lon:
            SizeLon.backgroundColor = UIColor.green
            break
        case .Vua:
            SizeVua.backgroundColor = UIColor.green
            break
        case .Nho:
            SizeNho.backgroundColor = UIColor.green
            break
        }
    }
    
    public enum SizeSanPham {
        case Nho
        case Vua
        case Lon
    }
}

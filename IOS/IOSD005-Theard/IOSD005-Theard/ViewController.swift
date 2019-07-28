//
//  ViewController.swift
//  IOSD005-Theard
//
//  Created by ADMIN on 7/26/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            self.img.loadFromURL("https://media.techz.vn/upload/2018/02/22/image-1519282087-Infinity-Display-wallpapers.jpg")
        }
    }

}

extension UIImageView{
    func loadFromURL(_ urlImage: String){
        guard let url = URL(string: urlImage) else{
            return
        }
        
        do{
            if let data = try? Data(contentsOf: url){
                if let img = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = img
                    }
                }
            }
        }catch{
            return
        }
    }
}

//
//  WecomelViewController.swift
//  OderApp
//
//  Created by ADMIN on 5/24/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class WecomelViewController: UIViewController {

    var sqlite : SQLiteDatabase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sqlite = SQLiteDatabase.openDatabase(pathName: "/Users/admin/GitPublic/IOS/OderApp/OderApp/Db/TestAppDB.db")
        
//        sqlite = SQLiteDatabase.openDatabase(pathName: "/Users/admin/GitPublic/IOS/OderApp/SQL/OderApp.db")
        
        // Do any additional setup after loading the view.
        print("Ket noi DB: \(sqlite)")
        
//        if sqlite!.loginApp(userName: "Nghi", pass: "1234561") {
//            print("Login Thanh Cong")
//        }else{
//            var aller = UIAlertView()
//            aller.title = "Canh báo"
//            aller.message = "Login Thất bại"
//            aller.addButton(withTitle: "Đóng")
//            aller.show()
//        }
        
//        var aller = UIAlertView()
//        aller.title = "Thông báo"
//
//        if sqlite!.registerUser(userName: "uesr2ww", pass: "pass2ww"){
//            aller.message = "Register Thành công"
//        }else{
//            aller.message = "Register Thất bại"
//        }
//
//
//        aller.addButton(withTitle: "Đóng")
//        aller.show()
        
        print("registerUser: \(sqlite?.registerUser(userName: "ABCWOE", pass: "123"))")
    
        print("loginApp: \(sqlite?.loginApp(userName: "ABCWOE", pass: "123"))")
        
        print("updateUser: \(sqlite?.updateUser(userName: "ABCWOE", pass: "1234"))")
        
        print("loginApp: \(sqlite?.loginApp(userName: "ABCWOE", pass: "123"))")
        
        print("loginApp: \(sqlite?.loginApp(userName: "ABCWOE", pass: "1234"))")
        
        print("deleteUser: \(sqlite?.deleteUser(userName: "ABCWOE"))")
        
        print("loginApp: \(sqlite?.loginApp(userName: "ABCWOE", pass: "1234"))")
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

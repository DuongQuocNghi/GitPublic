//
//  SQLiteDatabase.swift
//  OderApp
//
//  Created by ADMIN on 6/19/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteDatabase {
    
    fileprivate let dbPointer:OpaquePointer?
    
    init(pointer: OpaquePointer?) {
        self.dbPointer = pointer
    }
    
    static func openDatabase(pathName:String) -> SQLiteDatabase? {
        var dbConnect:OpaquePointer?=nil
        if sqlite3_open(pathName, &dbConnect) == SQLITE_OK {
            return SQLiteDatabase(pointer: dbConnect)
        }
        else{
            return nil
        }
    }
    
    func loginApp(userName:String,pass:String) -> Bool {
        if(dbPointer != nil){
            let sqliteExecute = "SELECT count(UserName) " +
                                "FROM TaiKhoan " +
                                "WHERE UserName like '\(userName)' AND " +
                                "Password = '\(pass)'"
            var kq : OpaquePointer? = nil
            sqlite3_prepare_v2(dbPointer, sqliteExecute, -1, &kq, nil)
            
            if kq != nil{
                sqlite3_step(kq)
                let sum = sqlite3_column_int(kq, 0)
                sqlite3_finalize(kq)
                if sum == 0{
                    return false
                }else{
                    return true
                }
            }
        }
        return false
    }
    
    
    func registerUser(userName:String,pass:String) -> Bool {
        if(dbPointer != nil){
            if !checkUserApp(userName: userName){
                let sqliteExecute = "INSERT INTO TaiKhoan(UserName, Password) VALUES (?, ?)"
                                    //"VALUES ('\(userName)', '\(pass)')"
                var kq : OpaquePointer? = nil
                if sqlite3_prepare_v2(dbPointer, sqliteExecute, -1, &kq, nil) == SQLITE_OK{
                    
                    sqlite3_bind_text(kq, 1, (userName as? NSString)?.utf8String, -1, nil)
                    sqlite3_bind_text(kq, 2, (pass as? NSString)?.utf8String, -1, nil)

                    let abc = sqlite3_step(kq)
                    
                    if abc == SQLITE_DONE{
                        sqlite3_finalize(kq)
                        return true
                    }
                }
            }
        
        }
        return false
    }
    
    func updateUser(userName:String,pass:String) -> Bool {
        if(dbPointer != nil){
            if checkUserApp(userName: userName){
                let sqliteExecute = "UPDATE TaiKhoan SET Password = ? WHERE UserName = ?"
                var kq : OpaquePointer? = nil
                if sqlite3_prepare_v2(dbPointer, sqliteExecute, -1, &kq, nil) == SQLITE_OK{
                    
                    sqlite3_bind_text(kq, 1, pass, -1, nil)
                    sqlite3_bind_text(kq, 2, (userName as? NSString)?.utf8String, -1, nil)
                    
                    let abc = sqlite3_step(kq)
                    
                    if abc == SQLITE_DONE{
                        sqlite3_finalize(kq)
                        return true
                    }
                }
            }
            
        }
        return false
    }
    
    func deleteUser(userName:String) -> Bool {
        if(dbPointer != nil){
            if checkUserApp(userName: userName){
                let sqliteExecute = "DELETE FROM TaiKhoan WHERE UserName = ?"
                var kq : OpaquePointer? = nil
                if sqlite3_prepare_v2(dbPointer, sqliteExecute, -1, &kq, nil) == SQLITE_OK{
                    
                    sqlite3_bind_text(kq, 1, userName, -1, nil)
                    
                    let abc = sqlite3_step(kq)
                    
                    if abc == SQLITE_DONE{
                        sqlite3_finalize(kq)
                        return true
                    }
                }
            }
            
        }
        return false
    }
    
    func checkUserApp(userName:String) -> Bool {
        if(dbPointer != nil){
            let sqliteExecute = "SELECT count(UserName) " +
                                "FROM TaiKhoan " +
                                "WHERE UserName like '\(userName)' "
            var kq : OpaquePointer? = nil
            sqlite3_prepare_v2(dbPointer, sqliteExecute, -1, &kq, nil)
            
            if kq != nil{
                sqlite3_step(kq)
                let sum = sqlite3_column_int(kq, 0)
                sqlite3_finalize(kq)
                if sum == 0{
                    return false
                }else{
                    return true
                }
            }
        }
        return false
    }
    
}

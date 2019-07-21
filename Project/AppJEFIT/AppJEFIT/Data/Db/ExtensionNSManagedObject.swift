//
//  ExtensionNSManagedObject.swift
//  AppJEFIT
//
//  Created by ADMIN on 7/12/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObject{
    class var context: NSManagedObjectContext! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContraner.viewContext
    }
    
    class var request: NSFetchRequest<NSManagedObject> {
        return NSFetchRequest(entityName: String(describing: self))
    }
    
    func save(sucess: (()-> Void)?, fail:((Error) -> Void)) {
        guard let context = self.managedObjectContext else {
            print("Error Class Entity Can't connect Core Data")
            fail(NSError(domain: "", code: 5000, userInfo: nil))
            return
        }
        
        if context.hasChanges {
            do{
                try context.save()
                sucess?()
            }catch{
                fail(error)
            }
        }else{
            print("Not change Database")
            fail(NSError(domain: "", code: 5001, userInfo: nil))
        }
    }
    
    class func getAll(sucess: (([NSManagedObject])-> Void)?, fail:((Error) -> Void)) {
        do{
            let result = try context.fetch(request)
            sucess?(result)
        }catch{
            fail(error)
        }
    }
    
    class func getByCause(predicate : NSPredicate,sucess: (([NSManagedObject])-> Void)?, fail:((Error) -> Void) ) {
        request.predicate = predicate
        do{
            let result = try context.fetch(request)
            sucess?(result)
        }catch{
            fail(error)
        }
    }
}


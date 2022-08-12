//
//  UserEntity+CoreDataProperties.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 02/08/22.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?

        class func create(_name: String?, _email: String?, _password: String?) -> UserEntity {
             let user = UserEntity(context: PersistentStorage.shared.context)
             user.name = _name
             user.email = _email
             user.password = _password
            
            return user
        }

    
}

extension UserEntity : Identifiable {

}

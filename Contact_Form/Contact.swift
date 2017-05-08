//
//  Contact.swift
//  Contact_Form
//
//  Created by Hayden Goldman on 5/8/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import Foundation

class Contact {
    
    var name :String!
    var title :String!
    var company :String!
    var email :String!
    var phoneNumber :String!
    
    
    func toDictionary() -> [String:Any] {
        
        return ["title":self.title,"name":self.name,"company":self.company,"email":self.email,"phoneNumber":self.phoneNumber]
    }
    
    
    
}

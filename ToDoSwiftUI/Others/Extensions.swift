//
//  Extensions.swift
//  ToDoSwiftUI
//
//  Created by Ullash Podder on 26/11/2023.
//

import Foundation
let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
let minPasswordLength = 6
//MARK: - String
extension String {
    func isEmail() -> Bool {
        return __emailPredicate.evaluate(with: self)
    }
    func isValidPassword() -> Bool{
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count >= minPasswordLength
    }
}
//MARK: - Codable
extension Encodable{
    func asDictionary() -> [String:Any]{
        guard let data = try? JSONEncoder().encode(self) else
        { 
            return [:]
        }
        do{
            let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return jsonObject ?? [:]
        } catch{
            return [:]
        }
    }
}

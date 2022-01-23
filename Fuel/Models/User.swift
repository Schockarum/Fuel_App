//
//  User.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var gender: Gender
    var healthData: HealthData
    
    init(name _name: String = "John Doe", age _age: Int = 15, healthData _healthData: HealthData = HealthData()){
        name = _name
        age = _age
        gender = Gender.Unspecified
        healthData = _healthData
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case Male = "Male"
    case Female = "Female"
    case NonBinary = "Non Binary"
    case Unspecified = "Unspecified"
    
    var id: String { self.rawValue}    
//    func description() -> String {
//        var desc = "Unknown"
//        switch self {
//        case .Male:
//            desc = "Male"
//        case .Female:
//            desc = "Female"
//        case .NonBinary:
//            desc = "Non Binary"
//        case .Unspecified:
//            desc = "Unspecified"
//        }
//        return desc
//    }
}

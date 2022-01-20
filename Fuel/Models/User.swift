//
//  User.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import Foundation
import UIKit

struct User {
    var firstName:  String
    var middleName: String
    var lastName:   String
    var age:        Int
    var gender:     Gender
    var healthData: HealthData
    
    init(firstName          name:    String,
         lastName           last:    String,
         age                _age:    Int,
         middleName         middle:  String  = "",
         fatPercentage      fat:     Float   = 0.0,
         weight             _weight: Float   = 0.0,
         hoursOfExcercise   hours:   Float   = 1.0,
         gender             _gender: Gender  = Gender.Unspecified) {
        firstName   = name
        middleName  = middle
        lastName    = last
        age         = _age
        healthData  = HealthData(weight: _weight, fatPercentage: fat, hoursOfExcercisePerWeek: hours)
        gender      = _gender
    }
}

enum Gender{
    case Male
    case Female
    case NonBinary
    case Unspecified
}

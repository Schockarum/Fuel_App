//
//  HealthData.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import Foundation
import UIKit

struct HealthData {
    var fatPercentage: Float
    var weight: Float
    var hoursOfExcercisePerWeek: Float
    var leanBodyMass: Float {
        get {
            let lbm = ((1-fatPercentage/100)*weight)
            return lbm
        }
    }
    var basalMetabolicRate: Float {
        get {
            let bmr = 370 + (21.6 * leanBodyMass)
            return bmr
        }
    }
    var totalDailyEnergyExpenditure: Int {
        get {
            let tdee = basalMetabolicRate * hoursOfExcercisePerWeek
            return Int(tdee)
        }
    }

    init(weight w: Float, fatPercentage fp: Float, hoursOfExcercisePerWeek hours: Float){
        weight = w
        fatPercentage = fp
        hoursOfExcercisePerWeek = hours
    }
}

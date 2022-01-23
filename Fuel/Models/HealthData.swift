//
//  HealthData.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import Foundation

struct HealthData {
    var fatPercentage: Float
    var hoursOfExcercise: Float
    var weight: Float
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
            let tdee = basalMetabolicRate * hoursOfExcercise
            return Int(round(tdee))
        }
    }

    init(weight w: Float = 50.0, fatPercentage fp: Float = 15.0, hoursOfExcercisePerWeek hours: Float = 1.0){
        weight = w
        fatPercentage = fp
        hoursOfExcercise = hours
    }
}

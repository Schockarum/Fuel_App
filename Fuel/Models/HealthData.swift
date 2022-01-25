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
    var dietObjective: DietObjective
    
    // MARK: - COMPUTED PROPERTIES
    var proteinIntakeObjective: Float {
        get {
            var protein: Float
            switch dietObjective {
            case .cutting:
                protein = weight * 2.6
            case .mantaining, .bulking:
                protein = weight * 2.2
            }
            return protein * 4
        }
    }
    var fatIntakeObjective: Float {
        get {
            var fat: Float
            switch dietObjective {
            case .cutting:
                fat = weight * 0.44
            case .mantaining:
                fat = weight * 0.77
            case .bulking:
                fat = weight * 0.88
            }
            return fat * 9
        }
    }
    var carbIntakeObjective: Float {
        get {
            var carbs: Float
            switch dietObjective {
            case .cutting:
                carbs = weight * 2.2
            case .mantaining:
                carbs = weight * 3.5
            case .bulking:
                carbs = weight * 4.4
            }
            return carbs * 4
        }
    }
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
            var k: Float
            switch hoursOfExcercise {
            case 0.0..<3.0:
                k = 1.2
            case 3.0..<6.0:
                k = 1.35
            default:
                k = 1.5
            }
            let tdee = basalMetabolicRate * k
            return Int(round(tdee))
        }
    }
    
    
    // MARK: - FUNCTIONS
    init(weight w: Float = 50.0, fatPercentage fp: Float = 15.0, hoursOfExcercisePerWeek hours: Float = 1.0){
        weight = w
        fatPercentage = fp
        hoursOfExcercise = hours
        dietObjective = DietObjective.mantaining
    }
    
    func getCalorieTotal() -> Float{
        let calorieTotal = proteinIntakeObjective + carbIntakeObjective + fatIntakeObjective
        return calorieTotal
    }
    
    enum DietObjective{
        case cutting
        case mantaining
        case bulking
    }
}

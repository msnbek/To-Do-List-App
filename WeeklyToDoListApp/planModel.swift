//
//  planModel.swift
//  WeeklyToDoListApp
//
//  Created by Mahmut Şenbek on 17.10.2022.
//

import Foundation
import UIKit


class PlanModel {
    
    static let sharedInstance = PlanModel()
    
    var firstPlan = ""
    var secondPlan = ""
    var thirdPlan = ""
    var fourthPlan = ""
    var fifthPlan = ""
    var sixthPlan = ""
    var dayLabel = ""
    
    private init(){}
    
}

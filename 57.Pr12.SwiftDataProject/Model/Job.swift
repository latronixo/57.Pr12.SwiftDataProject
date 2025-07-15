//
//  Job.swift
//  57.Pr12.SwiftDataProject
//
//  Created by Валентин on 15.07.2025.
//

import Foundation
import SwiftData

 @Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}

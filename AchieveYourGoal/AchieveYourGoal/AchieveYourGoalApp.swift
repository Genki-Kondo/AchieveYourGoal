//
//  AchieveYourGoalApp.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/26.
//

import SwiftUI

@main
struct AchieveYourGoalApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: HomeViewModel())
        }
    }
}

//
//  GoalData.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/29.
//
import Foundation
import RealmSwift

    
//参考した記事 mvvm swiftui realm
//https://software.small-desk.com/development/2022/01/28/swiftui-realm-create-todoapp/
class GoalData: Object,Identifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var goalTitle: String
    @Persisted var achievementFlag: Bool
    @Persisted var currentAchievementLevel: Int
    @Persisted var themeColorType : Int
    @Persisted var deadlineDate : Date
    @Persisted var goalMemo : String
    @Persisted var mileStone = RealmSwift.List<MileStone>()
}

//リレーション関係を参考にした記事
//https://tech.amefure.com/swift-realm-list

class MileStone :Object,Identifiable {
    @Persisted var mileStoneTitle: String
    @Persisted var mileStoneAchievementFlag: Bool
    @Persisted var deadlineDate : Date
    @Persisted var goalMemo : String
}


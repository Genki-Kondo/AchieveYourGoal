//
//  HomeViewModel.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/26.
//

import Foundation
final class HomeViewModel : ObservableObject{
    @Published var branchList: [String] = []
    
    @Published var homeModeList : [HomeMode] = []
    
    //モードを選択する処理
    func selectMode(index : Int){
        
    }
    
    
}

//
//  ContentView.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/26.
//

import SwiftUI

enum HomeMode : Int{
    case record = 0
    case report = 1
    case trash = 2
}

struct HomeView: View {
    
    
    //branchListViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    @State var isOpenConfig : Bool = false
    @State var currentModeList : [Bool] = [true,false,false]
    @State var currentMode : HomeMode = HomeMode.record
    var body: some View {
       
        NavigationStack {
            Group{
                VStack{
                    HStack{
                        Button(action: {
                            currentMode = .record
                            selectMode(index: 0)
                            print("記録ボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "pencil.line", currentMode: .record, activeFlag: currentModeList[0])
                                
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        Button(action: {
                            currentMode = .report
                            selectMode(index: 1)
                            print("レポートボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "chart.bar.doc.horizontal", currentMode: .report, activeFlag: currentModeList[1])
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        Button(action: {
                            currentMode = .trash
                            selectMode(index: 2)
                            print("削除ボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "trash.fill", currentMode: .trash, activeFlag: currentModeList[2])
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }// :Hstack
                    Spacer()
                }// :Vstack
            }// :Group
            .overlay(content: {
                if currentMode == .record{
                    Button(action: {
                        print("プラスボタンタップ")
                    }, label: {
                        PlusButtonImage(borderColor: .blue, frameSize: 80, borderSize: 60)
                    })
                    .padding(EdgeInsets(top: screenBounds.height/2 , leading: 0, bottom: 0, trailing: 0))
                }
            })
            .toolbar {
                ToolBarContents(leftAction: {leftAction()}, rightAction: {openHomeConfig()},leftButtonMode: 0,rightButtonMode: 1,title: "ホーム")
                
            }
        }// :NavigationView
    }
    //ホーム設定画面を開く処理
    func openHomeConfig(){
        self.isOpenConfig.toggle()
    }
    //モードを選択した時の処理
    func selectMode(index : Int){
        currentModeList[index] = true
        for i in 0..<3{
            if(i != index){
                currentModeList[i] = false
            }
        }
        
    }
}
struct ModeButtonImage : View {
    
    let imageName : String
    let currentMode : HomeMode
    let activeFlag : Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40,height: 40)
                .foregroundColor(.white)
                .shadow( radius: activeFlag ? 20 : 0)
        
            Image(systemName: imageName)
                .resizable()
                .foregroundColor(.black)
                .frame(width: 30,height: 30)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}

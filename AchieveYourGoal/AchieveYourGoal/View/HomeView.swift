//
//  ContentView.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/26.
//

import SwiftUI


struct HomeView: View {
    
    
    enum HomeMode : Int{
        case record = 0
        case report = 1
        case trash = 2
    }
    
    //branchListViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        var currentMode : HomeMode = HomeMode.record
        NavigationView {
            Group{
                VStack{
                    HStack{
                        Button(action: {
                            currentMode = .record
                            print("記録ボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "pencil.line")
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        Button(action: {
                            currentMode = .report
                            print("レポートボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "chart.bar.doc.horizontal")
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                        Button(action: {
                            currentMode = .trash
                            print("削除ボタンタップ")
                        }, label: {
                            ModeButtonImage(imageName: "trash.fill")
                        })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                      
                    }// :Hstack
                    Spacer()
                }// :Vstack
            }
            .toolbar {
                ToolBarContents(leftAction: {leftAction()}, rightAction: {rightAction()},leftButtonMode: 0,rightButtonMode: 1,title: "ホーム")
            }
        }// :NavigationView
    }
}
struct ModeButtonImage : View {
    
    let imageName : String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40,height: 40)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
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

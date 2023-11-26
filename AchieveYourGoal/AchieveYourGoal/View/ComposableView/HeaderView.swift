//
//  HeaderView.swift
//  takamiya-skynet
//
//  Created by fantec on 2023/11/14.
//

import SwiftUI

//https://software.small-desk.com/development/2020/09/29/swiftui-toolbar/#google_vignette
//上記の記事を参考にコンポーネント化した
//ヘッダーのコンポーネント
struct HeaderView: View {
    
    @State private var mode: Int = 0
    
    @State private var navigationTitle: String = "タイトル"
    
    
    var body: some View {
        NavigationView {
            Group{
                List {
                    ForEach(1..<5) { i in
                        Text("Text \(i)")
                    }
                    Text("テストです")
                }
            }
            .toolbar {
                ToolBarContents(leftAction: {leftAction()}, rightAction: {rightAction()},leftButtonMode: 1,rightButtonMode: 1,title: "筋トレ")
            }
        }
    }
}
func leftAction(){
    print("leftAction")
}
func rightAction(){
    print("rightAction")
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}


//https://software.small-desk.com/development/2020/09/29/swiftui-toolbar/#google_vignette
//上記の記事を参考にコンポーネント化した
//ヘッダーのコンポーネント
struct ToolBarContents: ToolbarContent {
    let leftAction : () -> Void
    let rightAction : () -> Void
    let leftButtonMode : Int
    let rightButtonMode : Int
    let title : String
//    @State var isOpenSideMenu: Bool = false
//    @State var text = "Hello, World!"
    var body: some ToolbarContent {
       
        
        ToolbarItem(placement: .principal){
            Group{
                HStack{
                    Button(action: {
                        leftAction()
                    }, label: {
                        if leftButtonMode == 0{
                            NavigationBarItemImage(imageName: "", isSystemName: false)
                        }else if leftButtonMode == 1{
                            NavigationBarItemImage(imageName: "icon.config", isSystemName: false)
                        }else if leftButtonMode == 2{
                            NavigationBarItemImage(imageName: "icon.config", isSystemName: true)
                        }
                    })
                    
                    Spacer()
                    Text(title)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                        .frame(width: 200,height: 100,alignment: .center)
                    
                    Spacer()
                    
                    Button(action: {
                        rightAction()
                    }, label: {
                        
                        if rightButtonMode == 0{
                            NavigationBarItemImage(imageName: "", isSystemName: false)
                        }else if rightButtonMode == 1{
                            NavigationBarItemImage(imageName: "icon.config", isSystemName: false)
                        }else if rightButtonMode == 2{
                            NavigationBarItemImage(imageName: "icon.config", isSystemName: false)
                        }
                        
                    })
                }// :Hstack
            }// :Group
        }// : ToolbarItem
        
    }
}


struct NavigationBarItemImage: View {
    let imageName : String
    let isSystemName : Bool
    var body: some View {
            if isSystemName{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 40,height: 40)
                    .padding()
            }else{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 40,height: 40)
                    .padding()
            }
    }
}

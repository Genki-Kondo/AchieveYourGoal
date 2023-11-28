//
//  PlusButton.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/28.
//

import SwiftUI

struct PlusButtonImage: View {
    let borderColor : Color
    let frameSize : Double
    let borderSize : Double
   
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: frameSize,height: frameSize)
                .foregroundStyle(.white)
                .shadow(radius: 20)
            Image(systemName: "plus")
                .resizable()
                .frame(width: borderSize,height: borderSize)
                .foregroundStyle(borderColor)
        }
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray
            PlusButtonImage(borderColor: .blue ,frameSize: 100, borderSize: 80)
        }
        
    }
}

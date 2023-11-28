//
//  HomeConfigView.swift
//  AchieveYourGoal
//
//  Created by 近藤元気 on 2023/11/28.
//

import SwiftUI

struct HomeConfigView: View {
    @Binding var isOpen : Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeConfigView_Previews: PreviewProvider {
    static var previews: some View {
        HomeConfigView(isOpen: .constant(true))
    }
}

//
//  MainTabView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            TargetDataView()
                .tabItem{
                    Label("Target",
                          systemImage:"waveform.path.ecg.rectangle")
                }
            
            UserProfileView()
                .tabItem
            {
                Label("Health Data",
                      systemImage: "heart.text.square")
            }
        }
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 11")
    }
}

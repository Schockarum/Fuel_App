//
//  UserProfileView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import SwiftUI

struct UserProfileView: View {
    @State var currentUser: User = User()
    let frameWidth: CGFloat = 80.0
    let frameHeight: CGFloat = 50.0
    
    var body: some View {
        VStack {
            Image("Banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 425, height: 160)
                .clipped()
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.white, lineWidth: 5)
                }
                .ignoresSafeArea()
                .offset(y: -50)
                .padding(.bottom)
            HStack {
                Image("ProfilePic")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 5)
                    }
                    .padding(.leading)
                VStack(alignment: .leading) {
                    Text("Shortie ⚡️")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .minimumScaleFactor(0.5)
                        .frame(height: 50)
                        .padding([.top, .trailing])
                    Text("Dripping with style")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .offset(x: 10, y: 25)
                Spacer()
            }
            .offset(y: -115)
            Spacer()
        }
    }
}

struct HealthData_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
    }
}

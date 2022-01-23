//
//  OrderView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import Combine
import SwiftUI

struct HealthDataView: View {
    @State var currentUser: User = User()
    
    var body: some View {
        NavigationView {
            Form {
                HStack{
                    Text("Name")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 80, height: 50)
                    Spacer()
                    TextField("Full name",
                              text: $currentUser.name)
                        .textFieldStyle(.automatic)
                        .padding(.leading)
                }
                
                HStack {
                    Text("Age")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 80, height: 50)
                    Spacer()
                    TextField("How old are you?",
                              value: $currentUser.age,
                              formatter: NumberFormatter())
                        .textFieldStyle(.automatic)
                        .padding(.leading)
                }
                
                HStack {
                    Text("Gender")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 80, height: 50)
                    Picker(currentUser.gender.rawValue,
                           selection: $currentUser.gender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                                .tag(gender.rawValue)
                        }
                    }
                           .padding(.leading)
                }
                
                HStack {
                    Text("Weight")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 80, height: 50)
                    TextField("Weight",
                              value: $currentUser.healthData.weight,
                              formatter: NumberFormatter())
                        .padding(.leading)
                }
            }
            .navigationTitle("Health Data")
        }
    }
}

struct HealthData_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HealthDataView()
        }
    }
}

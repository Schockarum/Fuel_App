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
    let frameWidth: CGFloat = 80.0
    let frameHeight: CGFloat = 50.0
    
    var body: some View {
        NavigationView {
            Form {
                HStack{
                    Text("Name")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: frameWidth, height: frameHeight)
                    Spacer()
                    TextField("Full name",
                              text: $currentUser.name)
                        .textFieldStyle(.automatic)
                        .padding(.leading)
                }.onTapGesture {
                    self.hideKeyboard()
                  }
                
                HStack {
                    Text("Age")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: frameWidth, height: frameHeight)
                    Spacer()
                    TextField("How old are you?",
                              value: $currentUser.age,
                              formatter: NumberFormatter())
                        .textFieldStyle(.automatic)
                        .padding(.leading)
                        .keyboardType(.numberPad)
                }.onTapGesture {
                    self.hideKeyboard()
                  }
                
                HStack {
                    Text("Gender")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: frameWidth, height: frameHeight)
                    Picker(currentUser.gender.rawValue,
                           selection: $currentUser.gender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                                .tag(gender.rawValue)
                        }
                    }
                           .padding(.leading)
                }.onTapGesture {
                    self.hideKeyboard()
                  }
                
                HStack {
                    Text("Weight [Kg]")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: frameWidth, height: frameHeight)
                    TextField("Weight",
                              value: $currentUser.healthData.weight,
                              formatter: NumberFormatter())
                        .padding(.leading)
                        .keyboardType(.numberPad)
                }.onTapGesture {
                    self.hideKeyboard()
                  }
                
                HStack {
                    Text("Fat Percentage")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: frameWidth, height: frameHeight)
                        .minimumScaleFactor(0.5)
                    TextField("Fat Percentage",
                              value: $currentUser.healthData.fatPercentage,
                              formatter: NumberFormatter())
                        .padding(.leading)
                        .keyboardType(.numberPad)
                }.onTapGesture {
                    self.hideKeyboard()
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

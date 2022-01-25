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
        ScrollView {
            VStack {
                // MARK: - Banner
                Image("Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .overlay {
                        Rectangle().stroke(.white, lineWidth: 5)
                    }
                //                .ignoresSafeArea()
                //                .offset(y: -51)
                    .padding(.bottom)
                // MARK: - Foto de Perfil y Nombre
                HStack {
                    Image("ProfilePic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
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
                            .frame(height: 30)
                            .padding([.top, .trailing])
                        Text("Dripping with style")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        //                        .offset(y: -20)
                    }
                    //                .offset(x: 10, y: 25)
                    Spacer()
                }
                //            .offset(y: -115)
                Divider()
                //                .offset(y: -100)
                
                // MARK: - Objetivos Calóricos
                VStack {
                    HStack {
                        Text("Caloric Objectives 🍲")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .fontWeight(.medium)
                            .padding(.leading)
                        Spacer()
                    }
                    //                .offset(y: -100)
                    Text(String(format:"%.2f Cal",currentUser.healthData.getCalorieTotal()))
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding([.leading, .bottom, .trailing])
                    HStack {
                        Spacer()
                        VStack {
                            Text("Carbs")
                                .fontWeight(.medium)
                            Text(String(format:"%.2f Cal",currentUser.healthData.carbIntakeObjective))
                        }
                        Spacer()
                        VStack {
                            Text("Protein")
                                .fontWeight(.medium)
                            Text(String(format:"%.2f Cal",currentUser.healthData.proteinIntakeObjective))
                        }
                        Spacer()
                        VStack {
                            Text("Fats")
                                .fontWeight(.medium)
                            Text(String(format:"%.2f Cal",currentUser.healthData.fatIntakeObjective))
                        }
                        Spacer()
                    }
                    Divider()
                    // MARK: - Datos del Usuario
                    HStack {
                        Text("Current Data")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .fontWeight(.medium)
                            .padding([.leading, .bottom])
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("Weight")
                                .fontWeight(.bold)
                            TextField("Current weight", value: $currentUser.healthData.weight, format: .number)
                                .frame(width: 50, alignment: .center)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                            Text("Lean Body Mass")
                                .fontWeight(.bold)
                            Text(String(format:"%.2f",currentUser.healthData.leanBodyMass))
                        }
                        Spacer()
                        VStack {
                            Text("Fat %")
                                .fontWeight(.bold)
                            TextField("Fat Percentage", value: $currentUser.healthData.fatPercentage, format: .number)
                                .frame(width: 50, alignment: .center)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                            Text("Basal Metabolic Rate")
                                .fontWeight(.bold)
                            Text(String(format: "%.2f", currentUser.healthData.basalMetabolicRate))
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

struct HealthData_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
.previewInterfaceOrientation(.portrait)
        }
    }
}

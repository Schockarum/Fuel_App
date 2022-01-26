//
//  UserProfileView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 19/01/22.
//

import SwiftUI

struct UserProfileView: View {
    @State private var currentUser: User = User()
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                // MARK: - Banner
                Image("Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height + geometry.frame(in: .global).minY)
                    .clipped()
                    .offset(y: -geometry.frame(in: .global).minY) //Paralax deja pegada la imagen a la parte superior
            }
            .frame(width: screenWidth, height: screenHeight/4.8)
            VStack (alignment: .leading){
                // MARK: - Foto de Perfil y Nombre
                HStack {
                    Image("ProfilePic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.clear , lineWidth: 5)
                        }
                        .shadow(radius: 5)
                        .padding(.leading)
                    VStack(alignment: .leading) {
                        Text("Shortie ⚡️")
                            .font(.title)
                            .fontWeight(.medium)
                            .minimumScaleFactor(0.5)
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
                    Picker("Phase", selection: $currentUser.healthData.dietObjective) {
                        ForEach(DietObjective.allCases) { objective in
                            Text(objective.rawValue.capitalized).tag(objective)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()

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
                        Text("User Data")
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
                    Text("Hours of Excercise per Week")
                        .fontWeight(.bold)
                        .padding(.top)
                    Picker("", selection: $currentUser.healthData.hoursOfExcercise) {
                        ForEach(1..<7, id:\.self) { hour in
                            Text("\(hour)").tag(hour)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
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

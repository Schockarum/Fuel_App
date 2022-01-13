//
//  TextfulView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 12/01/22.
//

import SwiftUI

struct TextfulView: View {
    var body: some View {
        VStack{
            Text("Textful")
//                .font(.title)
//                .fontWeight(.medium)
//                .bold()
//                .underline()
                .underline(true, color: .orange)
//                .italic()
                .padding()
                .font(.system(size: 50, weight: .medium, design: .rounded))
            
            Text("Subtitulos grandes que deberìamos de poner en múltiples líneas para poner en práctica el encuadrado de textos en una UI")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding()
                .frame(width: 200, height: 100, alignment: .center)
                .minimumScaleFactor(0.5)//El % mìnimo al que se reduce el texto si ya no cabe en el frame establecido)
        }
    }
}

struct TextfulView_Previews: PreviewProvider {
    static var previews: some View {
        TextfulView()
    }
}

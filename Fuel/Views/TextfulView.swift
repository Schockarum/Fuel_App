//
//  TextfulView.swift
//  Fuel
//
//  Created by Luis Mauricio Esparza Vazquez on 12/01/22.
//
/// Vista para jugar con SwiftUI
// TODO: No olvidar borrarla antes de intentar publicar :p
import SwiftUI


/// VIEW PARA TEXTO
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



/// VIEW PARA FORMAS
struct ShapingView: View {
    var body: some View {
        VStack{
            // MARK: - FORMAS
        Circle()
////            .fill(.orange)
////            .foregroundColor(.pink)
            .trim(from: 0.2, to: 1.0) //Solo un trim, va antes del stroke
////            .stroke(.orange)
//            .stroke(.orange, lineWidth: 30.0)
            .stroke(.green, style: StrokeStyle(lineWidth: 25.0, lineCap: .butt, dash: [40]))
//            Ellipse()
//            .frame(width: 50.0, height: 50.0, alignment: .leading)
//            .padding()
        Capsule(style: .circular)
            .frame(width: 200, height: 100)
            .foregroundColor(.blue)
        RoundedRectangle(cornerRadius: 20, style: .circular)
            .frame(width: 200, height: 100)
            .foregroundColor(.orange)
        }
    }
}

//Vista de colores
struct ColorView: View{
    var body: some View {
        // MARK: - COLORES
        //Con UIKit
        // #colorLiteral(red: 0.18, green: 0.5, blue: 0.75, alpha: 1)
        let myColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        // Con un ColorSet en Assets y Color [de SwiftUI]
        // Con un ColorSet podemos configurar aspecto de día y noche
        let customColor = Color("CustomColor")
        
        VStack{
            RoundedRectangle(cornerRadius: 25)
            // El color primario cambia cuando cambiamos de modo día a modo noche
//              .fill(Color.primary)
                .fill(customColor) //SwiftUI
//              .fill(Color(myColor)) //UIKit
                .frame(width: 200, height: 300)
//          Para aplicar la sombra, determinamos si será desde un UIColor o desde un Color [SwiftUI o UIKit]
                .shadow(color: Color(myColor).opacity(0.5), radius: 10, x: 10, y: 10)
                .padding()
            
            // MARK: - GRADIENTES
            let myGradient: LinearGradient = LinearGradient(
                                                gradient: Gradient(colors: [Color.yellow, Color.red, Color.purple]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing)
            let myRadGradient: RadialGradient = RadialGradient(colors: [Color.yellow,Color.green,Color.blue],
                                                               center: .bottomLeading, startRadius: 10, endRadius: 200)
            RoundedRectangle(cornerRadius: 25)
                .fill(myGradient)
                .frame(width: 200, height: 100)
                .shadow(color: Color(myColor).opacity(0.5), radius: 10, x: 10, y: 10)
            
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .fill(myRadGradient)
                .frame(width: 200, height: 100)
        }
    }
}

// MARK: - ICONS
struct IconsView: View {
    // TODOS LOS ÍCONOS ESTÁN SN SF SYMBOL
    var body: some View{
//        let gradient: RadialGradient = RadialGradient(colors: [Color.orange, Color.red],
//                                                      center: .center,
//                                                      startRadius: 5,
//                                                      endRadius: 50)
        VStack{
            Image(systemName: "heart.fill")
//                .font(.system(size: 150, weight: .bold, design: .rounded))
                .resizable()
            //.scaledToFit() //Hace lo mismo que configurar fit en aspect ratio
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .foregroundColor(Color.red)
                .opacity(0.5)
            //Si el corazón excede los límites del frame [Con scaled to fill usualmente] podemos recortar con
//                .clipped()
                .padding()
            
            Image(systemName: "folder.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
        }
    }
}

/// INSTANCIADOR DEL PREVIEW
struct TextfulView_Previews: PreviewProvider {
    static var previews: some View {
//        TextfulView()
        //ShapingView()
//        ColorView()
        IconsView()
    }
}

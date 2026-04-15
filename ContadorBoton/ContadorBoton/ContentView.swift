    //
    //  ContentView.swift
    //  ContadorBoton
    //
    //  Created by Alumno on 13/04/26.
    //
import SwiftUI

struct ContentView: View {
    
    // Variable para contar los clicks
        @State private var contador = 0
    // Variable pa el texto del usuario
        @State private var texto = ""
    // variable para el mensaje de alerta
        @State private var mensajealerta = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Contador de Botón")
                .font(.title)
                .fontWeight(.bold)
                       
    // Cuadro de texto
            TextField("Escribe aqui.", text: $texto)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
    // Mostrar cuántas veces se ha presionado
            Text("Has presionado el botón: \(contador) veces")
                .font(.headline)
    // Botón
            Button(action: {
                contador += 1 // se incrementa con cada cl
    // Mensaje cuando llega a 5
                if contador == 5 {
                    mensajealerta = true
                }
                
            }) {
                Text("Presionar")
                .padding()
                .background(contador >= 5 ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                }
            
                .disabled(contador >= 5)
                
        }
        .padding()
        
        //alerta
        .alert("Alcanzaste limite!!!", isPresented: $mensajealerta){
            Button("Cancelar", role:.cancel){}
            Button("Reiniciar", role:.none){
                contador = 0
            }
            
        } message: {
            Text("5 clicks permitidos")
        }
    }
}

#Preview {
    ContentView()
}

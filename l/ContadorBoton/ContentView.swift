//
//  ContentView.swift
//  ContadorControl
//
//  Created by Alumno on 13/04/26.
//

import SwiftUI

struct ContentView: View {
    
    // Variable para contar los clicks
        @State private var contador = 0
    // Variable pa el texto del usuario
        @State private var texto = ""
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
                }) {
                Text("Presionar")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                }
                
    // Mensaje cuando llega a 5
            if contador == 5 {
               Text("Eyy ya fueron 5 veces")
               .foregroundColor(.red)
               .font(.title2)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

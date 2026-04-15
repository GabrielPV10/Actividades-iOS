//
//  ContentView.swift
//  BotonVista
//
//  Created by Alumno on 13/04/26.
//

import SwiftUI

struct ContentView: View {
    
    // Variable para contar los clicks
    @State private var contador = 0
    // Variable pa el texto del usuario
    @State private var texto = ""
    
    @State private var vistados = false
    
    var body: some View {
        NavigationStack {
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
                    vistados = true
                }
            }) {
                Text("Presionar")
                    .padding()
                    .background(contador >= 5 ? Color.gray : Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .disabled(contador >= 5)
            
            Button("Reiniciar") {
                contador = 0
               
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Ir") {
                vistados = true
    
            }
            .padding()
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(10)
        
            //para la vista
            NavigationLink("", destination:  SegundaVista(contador: $contador), isActive: $vistados)  //Agregamos la variable para la segunda vista
                .hidden()
        }
                .padding()
                .navigationTitle("Inicio")
        }
    }
}
struct SegundaVista: View {
    
    // Recibe el contador como Binding
    @Binding var contador: Int
    // Pa regresar a la vista anterior
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            Text("¡Segunda vista!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Presionaste 5 veces el botón")
            /*
            Button("Reiniciar y regresar") {
                contador = 0
                dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)*/
        }
        .padding()
        Button("Reiniciar") {
            contador = 0
           
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        
        Button("Regresar") {
            dismiss()
        }
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(10)
        
        .navigationTitle("Acción")
    }
}


#Preview {
    ContentView()
}


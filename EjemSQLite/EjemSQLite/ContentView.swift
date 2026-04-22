//
//  ContentView.swift
//  EjemSQLite
//
//  Created by Alumno on 22/04/26.
//

import SwiftUI

 

struct ContentView: View {
    //Establecer conexion con DB
let db = DatabaseManager()

@State private var nombre = ""
@State private var lista: [String] = []
    var body: some View {
        VStack {
            Text("Mi primer conexion DB:")
                .font(.title)
            TextField("Nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Guardar"){
                db.insert(nombre: nombre)
                lista = db.fetch()
                nombre = ""
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            List(lista, id: \.self){ item in
                Text(item)
            }
            
        }
        .onAppear(){
            db.openDatabase()
            db.createTable()
            lista = db.fetch()
            
        }
    }
}

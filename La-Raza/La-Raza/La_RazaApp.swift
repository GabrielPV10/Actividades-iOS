//
//  La_RazaApp.swift
//  La-Raza
//
//  Created by Alumno on 25/03/26.
//
import SwiftUI

@main
struct La_RazaApp: App {
    @State private var estaAutenticado: Bool = false

    var body: some Scene {
        WindowGroup {
            if estaAutenticado {
                DashboardView(estaAutenticado: $estaAutenticado) // <- la siguiente pantalla (la creamos abajo)
            } else {
                LoginView(estaAutenticado: $estaAutenticado)
            }
        }
    }
}

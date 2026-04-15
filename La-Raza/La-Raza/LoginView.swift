//
//  LoginView.swift
//  La-Raza
//
//  Created by Alumno on 25/03/26.
//
import SwiftUI

// MARK: - Extensión para colores hexadecimales
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8 ) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Login View
struct LoginView: View {
    @State private var usuario: String = ""
    @State private var contrasena: String = ""
    @State private var mostrarContrasena: Bool = false

    // BINDING - controla si el usuario ya inició sesión
    @Binding var estaAutenticado: Bool

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: "4CAF50"),
                    Color(hex: "2E7D32")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                Image("LogoRaza")
                    .resizable()
                    .clipShape(.circle)
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 16)

                VStack(alignment: .leading, spacing: 16) {

                    Text("Iniciar sesión")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "1A1A1A"))

                    Text("Ingresa tus credenciales")
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: "888888"))
                        .padding(.top, -8)

                    // Campo Usuario
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color(hex: "3CB504"))
                        TextField("Usuario", text: $usuario)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .background(Color(hex: "F0FAF0"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "3CB504").opacity(0.4), lineWidth: 1)
                    )

                    // Campo Contraseña
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(Color(hex: "3CB504"))
                        if mostrarContrasena {
                            TextField("Contraseña", text: $contrasena)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        } else {
                            SecureField("Contraseña", text: $contrasena)
                        }
                        Button(action: {
                            mostrarContrasena.toggle()
                        }) {
                            Image(systemName: mostrarContrasena ? "eye" : "eye.slash")
                                .foregroundColor(Color(hex: "888888"))
                        }
                    }
                    .padding()
                    .background(Color(hex: "F0FAF0"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "3CB504").opacity(0.4), lineWidth: 1)
                    )

                    // Botón Entrar - AQUÍ USA EL BINDING
                    Button(action: {
                        if !usuario.isEmpty && !contrasena.isEmpty {
                            estaAutenticado = true
                        
                        }
                    }) {
                        Text("Entrar")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "3CB504"))
                            .cornerRadius(10)
                    }
                    .padding(.top, 4)
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
                .padding(.horizontal, 24)

                Spacer()

                Text("Sistema de Gestión Agropecuaria v1.0")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.bottom, 24)
            }
        }
    }
}



// Preview con .constant() porque el binding requiere un valor
#Preview {
    LoginView(estaAutenticado: .constant(false))
}

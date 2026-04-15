import SwiftUI

struct ContentView: View {
    
    // tamaño del tablero
    let filas = 6
    let columnas = 6
    
    // guardar donde hay minas
    @State var minas: [[Bool]] = []
    
    // guardar si ya se tocó la celda
    @State var tocado: [[Bool]] = []
    
    
    var body: some View {
        
        VStack {
            
            Text("busca minitas")
                .font(.title)
            
            Grid {
                
                ForEach(0..<filas, id: \.self) { f in
                    
                    GridRow {
                        
                        ForEach(0..<columnas, id: \.self) { c in
                            
                            Button {
                                tocar(f, c)
                            } label: {
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 40, height: 40)
                                    
                                    if minas.count > 0 {
                                        
                                        if tocado[f][c] {
                                            
                                            if minas[f][c] {
                                                Image("mina")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                            } else {
                                                Image("estrella")
                                                    .resizable()
                                                    .frame(width: 25, height: 25)
                                            }
                                            
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            Button("nuevo juego") {
                nuevoJuego()
            }
            .padding()
            
        }
        .onAppear {
            nuevoJuego()
        }
    }
    
    
    func nuevoJuego() {
        
        minas = []
        tocado = []
        
        for _ in 0..<filas {
            
            var filaMinas: [Bool] = []
            var filaTocado: [Bool] = []
            
            for _ in 0..<columnas {
                
                // mina aleatoria
                let hayMina = Int.random(in: 0...4) == 0
                
                filaMinas.append(hayMina)
                filaTocado.append(false)
            }
            
            minas.append(filaMinas)
            tocado.append(filaTocado)
        }
    }
    
    
    func tocar(_ f: Int, _ c: Int) {
        
        tocado[f][c] = true
        
    }
}

#Preview {
    ContentView()
}

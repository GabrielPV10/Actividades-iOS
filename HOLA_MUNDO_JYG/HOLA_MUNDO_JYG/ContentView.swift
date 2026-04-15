

import SwiftUI


struct ContentView: View {

        
        @State var contador = 0
        
        var body: some View {
            
            VStack {
                
                Text("contador de minas")
                    .font(.title)
                
                Image("mina")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .onTapGesture {
                        contador = contador + 1
                    }
                
                Text("clicks: \(contador)")
                    .font(.title2)
                
            }
        }
    }

    #Preview {
        ContentView()
    }
            #Preview{
                ContentView()
            }


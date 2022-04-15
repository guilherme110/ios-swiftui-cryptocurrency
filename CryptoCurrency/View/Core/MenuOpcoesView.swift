//
//  MenuOpcoesView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 14/04/22.
//

import SwiftUI

struct MenuOpcoesView: View {
    
    @State var menuOpcoes: [Opcao]
    
    var body: some View {
        HStack {
            ForEach(menuOpcoes) { opcao in
                Button(action: {
                    menuOpcoes.indices.forEach {
                        menuOpcoes[$0].selecionada = false
                        if (menuOpcoes[$0].id == opcao.id) {
                            menuOpcoes[$0].selecionada.toggle()
                        }
                    }
                }) {
                    VStack {
                        Text(opcao.texto)
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(opcao.selecionada ? .darkBlue : .grey500)
                            .fontWeight(.bold)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.lightBlue)
                            .opacity(opcao.selecionada ? 1 : 0)
                    }
                    .frame(minWidth: 0, alignment: .center)
                }
            }
        }
    }
}

struct MenuOpcoesView_Previews: PreviewProvider {
    static var previews: some View {
        let opcaoTeste1 = Opcao(selecionada: true, texto: "Teste 1")
        let opcaoTeste2 = Opcao(texto: "Teste 2")
        let opcaoTeste3 = Opcao(texto: "Teste 3")
        
        MenuOpcoesView(menuOpcoes: [opcaoTeste1, opcaoTeste2, opcaoTeste3])
            .previewLayout(.fixed(width: 400, height: 100))
    }
}

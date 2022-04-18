//
//  TransacoesView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 12/04/22.
//

import SwiftUI
import WrappingHStack

//MARK: - Funções Internas

fileprivate func criaMenuOpcoes() -> [Opcao] {
    let opcao1 = Opcao(selecionada: true, texto: "Lançadas")
    let opcao2 = Opcao(selecionada: false, texto: "Recebidas")
    
    return [opcao1, opcao2]
}

fileprivate func carregaDadosCards() -> [CardRetangulo] {
    let cardRetangulo1 = CardRetangulo(titulo: "73", subTitulo: "Esperando pela Confirmação", corFundo: Color.lightBlue, corFonte: Color.white)
    let cardRetangulo2 = CardRetangulo(titulo: "48", subTitulo: "Emparelhando", corFundo: Color.darkBlue, corFonte: Color.white)
    let cardRetangulo3 = CardRetangulo(titulo: "9", subTitulo: "Em Progresso", corFundo: Color.lightGreen, corFonte: Color.white)
    let cardRetangulo4 = CardRetangulo(titulo: "230", subTitulo: "Completas", corFundo: Color.white, corFonte: Color.black, addBorda: true)
    let cardRetangulo5 = CardRetangulo(titulo: "0", subTitulo: "Objeção ou Falha", corFundo: Color.lightPink, corFonte: Color.orange200)
    
    return [cardRetangulo1, cardRetangulo2, cardRetangulo3, cardRetangulo4, cardRetangulo5]
}

//MARK: - Struct View

struct TransacoesView: View {
    @ObservedObject var viewModel = TransacaoViewModel()
    
    var menuOpcoes = criaMenuOpcoes()
    var listaCardsRetangulo = carregaDadosCards()
    
    var body: some View {
        GeometryReader { view in
            ScrollView {
                VStack {
                    Text("Transações")
                        .font(.custom("Quicksand-Bold", size: 25))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                    MenuOpcoesView(menuOpcoes: menuOpcoes)
                        .frame(width: view.size.width, alignment: .leading)
                        .padding(.top, 45.0)
                    
                    WrappingHStack(listaCardsRetangulo, id: \.self) { cardRetangulo in
                        CardRetanguloView(cardRetangulo: cardRetangulo)
                            .padding(.top, 15.0)
                    }
                
                    Text("Novas Transações")
                        .font(.custom("Quicksand-Bold", size: 20))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top, 30.0)
                        .padding(.bottom, 20.0)
                    
                    ForEach(viewModel.transacoesRealizadas, id: \.self) { transacao in
                        Divider()
                        
                        DetalheTransacaoView(transacao: transacao)
                            .frame(width: view.size.width, height: 250, alignment: .top)
                    }
                    .padding(.bottom, 10.0)
                }
            }
        }
        .padding([.leading, .top], 15.0)
        .background(Color.grey200)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TransacoesView_Previews: PreviewProvider {
    static var previews: some View {
        TransacoesView()
            .previewLayout(.fixed(width: 400, height: 1400))
    }
}

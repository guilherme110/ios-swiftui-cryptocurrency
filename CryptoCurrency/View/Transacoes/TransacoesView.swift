//
//  TransacoesView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 12/04/22.
//

import SwiftUI
import WrappingHStack


fileprivate func criaMenuOpcoes() -> [Opcao] {
    let opcao1 = Opcao(selecionada: true, texto: "Lançadas")
    let opcao2 = Opcao(selecionada: false, texto: "Recebidas")
    
    return [opcao1, opcao2]
}

struct TransacoesView: View {
    var menuOpcoes = criaMenuOpcoes()
    
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
                    
                    WrappingHStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.lightBlue)
                            .overlay(
                                VStack {
                                    Text("73")
                                        .font(.custom("Quicksand-Bold", size: 25))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Esperando pela Confirmação")
                                        .font(.custom("Quicksand-Medium", size: 10))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                }
                                .padding([.leading, .trailing], 15.0)
                            )
                            .frame(width: 100, height: 120, alignment: .leading)
                            .padding(.top, 15.0)
                        
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.darkBlue)
                            .overlay(
                                VStack {
                                    Text("48")
                                        .font(.custom("Quicksand-Bold", size: 25))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Emparelhando")
                                        .font(.custom("Quicksand-Medium", size: 10))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                }
                                .padding([.leading, .trailing], 15.0)
                            )
                            .frame(width: 100, height: 120, alignment: .leading)
                            .padding(.top, 15.0)
                        
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.lightGreen)
                            .overlay(
                                VStack {
                                    Text("9")
                                        .font(.custom("Quicksand-Bold", size: 25))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Em Progresso")
                                        .font(.custom("Quicksand-Medium", size: 10))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                }
                                .padding([.leading, .trailing], 15.0)
                            )
                            .frame(width: 100, height: 120, alignment: .leading)
                            .padding(.top, 15.0)
                        
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.white)
                            .overlay(
                                VStack {
                                    Text("230")
                                        .font(.custom("Quicksand-Bold", size: 25))
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Completas")
                                        .font(.custom("Quicksand-Medium", size: 10))
                                        .foregroundColor(.black)
                                        .frame(width: 80, alignment: .leading)
                                }
                                .padding([.leading, .trailing], 15.0)
                            )
                            .frame(width: 100, height: 120, alignment: .leading)
                            .addBorder(Color.black, cornerRadius: 10)
                            .padding(.top, 15.0)
                        
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(Color.lightPink)
                            .overlay(
                                VStack {
                                    Text("0")
                                        .font(.custom("Quicksand-Bold", size: 25))
                                        .foregroundColor(.orange200)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    Text("Objeção ou Falha")
                                        .font(.custom("Quicksand-Medium", size: 10))
                                        .foregroundColor(.orange200)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                }
                                .padding([.leading, .trailing], 15.0)
                            )
                            .frame(width: 100, height: 120, alignment: .leading)
                            .padding(.top, 15.0)
                    }
                    
                    Text("Novas Transações")
                        .font(.custom("Quicksand-Bold", size: 20))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top, 30.0)
                        .padding(.bottom, 20.0)
                    
                    ForEach(transacoesRealizadas, id: \.self) { transacao in
                        
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

//
//  DetalheTransacaoView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 14/04/22.
//

import SwiftUI

struct DetalheTransacaoView: View {
    
    var transacao: TransacaoRealizada
    
    var body: some View {
        GeometryReader { view in
            
            VStack {
                HStack {
                    Text(transacao.origem)
                        .font(.custom("Quicksand-Bold", size: 18))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.grey400)
                        .overlay(
                            Text(StatusTransacoes(rawValue: transacao.status)?.nomeStatus ?? "")
                                .font(.custom("Quicksand-Bold", size: 12))
                                .foregroundColor(.grey500)
                                .fontWeight(.bold)
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        )
                        .frame(width: 120, height: 50, alignment: .leading)
                        .padding([.trailing], 15.0)
                }
                
                Text("Criador: \(transacao.autor)")
                    .font(.custom("Quicksand-Bold", size: 12))
                    .foregroundColor(.grey500)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.top, 10.0)
                Text("Número da Transação: \(transacao.numeroTransacao)")
                    .font(.custom("Quicksand-Bold", size: 12))
                    .foregroundColor(.grey500)
                    .fontWeight(.bold)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.top, 5.0)
                Text("Tipo: \(transacao.tipo)")
                    .font(.custom("Quicksand-Bold", size: 12))
                    .foregroundColor(.grey500)
                    .fontWeight(.bold)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.top, 5.0)
                
                HStack {
                    Button(action: {}, label: {
                    })
                    .frame(width: 120, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color.white)
                            .overlay(
                                Text("Deletar")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .font(.custom("Quicksand-Bold", size: 19))
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                            )
                            .addBorder(Color.black, cornerRadius: 10)
                    )
                    .padding(.trailing, 5.0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Aceitar")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.custom("Quicksand-Bold", size: 19))
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    })
                    .frame(width: 140, height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.grey200, lineWidth: 15))
                    .background(Color.lightBlue)
                    .padding(.trailing, 5.0)
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding([.bottom, .leading], 15.0)
                .padding(.top, 5.0)
            }
            .frame(width: view.size.width, height: 250, alignment: .top)
            .padding(.top, 15.0)
            .background(Color.grey200)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DetalheTransacaoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalheTransacaoView(transacao: transacoesRealizadas[0])
            .previewLayout(.fixed(width: 400, height: 250))
    }
}

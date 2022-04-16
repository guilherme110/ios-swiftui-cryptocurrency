//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 28/03/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { view in
                ScrollView {
                    VStack {
                        HeaderView()
                        
                        CardSaldoView()
                            .frame(width: view.size.width, height: 250, alignment: .top)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.grey200, lineWidth: 15))
                        
                        TesteCarroselView(
                            spacing: -50,
                            itemsData: transacoes,
                            zoomFactor: 0.65
                        ) { itemData in
                            CardTransacaoView(transacao: itemData)
                        }
                        .frame(width: view.size.width, height: 150)
                        .padding(.top, 30)
                        
                        HStack {
                            Text("Transações de Leilão")
                                .font(.custom("Quicksand-Bold", size: 16))
                                .foregroundColor(.darkBlue)
                                .fontWeight(.bold)
                              
                            Spacer()
                            
                            Label("Últimos 3 dias", systemImage: "clock.fill")
                                .font(.custom("Quicksand-Bold", size: 12))
                                .foregroundColor(.grey500)
                                .padding(.trailing, 15.0)
                            
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(EdgeInsets(top: 30.0, leading: 15.0, bottom: 0, trailing: 0))
                        
                        ForEach(listaRelatorios) { relatorio in
                            RelatoriosView(relatorio: relatorio)
                        }
                        .padding(.top, 15.0)
                    }
                }
            }
            .background(Color.grey200)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.fixed(width: 400, height: 1080))
    }
}

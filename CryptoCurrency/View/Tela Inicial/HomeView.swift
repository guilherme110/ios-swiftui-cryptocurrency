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
                        
                        RelatoriosView()
                            .frame(width: view.size.width, height: 200)
                            .padding(.top, 30)
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

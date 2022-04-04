//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 28/03/22.
//

import SwiftUI

struct HomeView: View {
    private struct TestStruct: Identifiable, Hashable {
        let id = UUID()
        let test = "Test"
    }
    
    var body: some View {
            GeometryReader { view in
                ScrollView {
                    VStack {
                        Text("Olá,")
                            .font(.custom("Quicksand-Bold", size: 20))
                            .foregroundColor(.grey500)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.top, 25.0)
                            .padding(.leading, 15.0)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Text("Sr. Guilherme Soares")
                            .font(.custom("Quicksand-Bold", size: 25))
                            .foregroundColor(.darkBlue)
                            .fontWeight(.bold)
                            .padding(.leading, 15.0)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
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
                        .padding(.top, 40.0)
                        .padding(.leading, 15.0)
                        
                        Divider()
                        
                        HStack {
                            Text("Relatório de Análises da Blockchain")
                                .font(.custom("Quicksand-Bold", size: 16))
                                .foregroundColor(.darkBlue)
                                .fontWeight(.bold)
                              
                            Spacer()
                            
                            Text("16.00 ETH")
                                .font(.custom("Quicksand-Bold", size: 16))
                                .foregroundColor(.green400)
                                .fontWeight(.bold)
                                .padding(.trailing, 15.0)
                            
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding([.top, .leading], 15.0)
                        
                        HStack {
                            VStack {
                                Text("Criado: 16.10.2019")
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                Text("Autor: Jason Howard")
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            }
                            .font(.custom("Quicksand-Bold", size: 12))
                            .foregroundColor(.grey500)
                            
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Visualizar")
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
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding([.bottom, .leading], 15.0)
                        
                    }
                }
                
                
            }
            .background(Color.grey200)
            .edgesIgnoringSafeArea(.all)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  CardSaldoView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 28/03/22.
//

import SwiftUI

struct CardSaldoView: View {
    var body: some View {
        GeometryReader { view in
            VStack {
                Text("Resumo Financeiro")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.custom("Quicksand-Bold", size: 19))
                    .padding([.top, .leading], 30.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("280.07 ETH")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.custom("Quicksand-Bold", size: 30))
                    .padding([.top, .leading], 30.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
                Label("Saldo Congelado: 1.0782 ETH", systemImage: "lock.fill")
                    .font(.custom("Quicksand-Bold", size: 12))
                    .foregroundColor(.grey500)
                    .padding(.leading, 30.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Depósito")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.custom("Quicksand-Bold", size: 19))
                    })
                    .frame(width: 100, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.white, lineWidth: 2))
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Dinheiro")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.custom("Quicksand-Bold", size: 19))
                    })
                    .frame(width: 100, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.white, lineWidth: 2))
                    
                    Spacer()
                    
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            NavigationLink(destination: TransacoesView()) {
                                Text("Conta")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.custom("Quicksand-Bold", size: 19))
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                             }
                        })
                        .frame(width: 80, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.grey200, lineWidth: 2))
                        .background(Color.lightBlue)
                    
                    
                    Spacer()
                }
                .padding([.top, .bottom], 15.0)
                .padding(.leading, 30.0)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            }
            .frame(width: view.size.width, height: 250, alignment: .top)
            .background(Color.darkBlue)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardSaldoView_Previews: PreviewProvider {
    static var previews: some View {
        CardSaldoView()
            .previewLayout(.fixed(width: 400, height: 250))
    }
}

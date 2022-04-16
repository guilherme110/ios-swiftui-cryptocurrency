//
//  RelatoriosView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 12/04/22.
//

import SwiftUI

struct RelatoriosView: View {
    
    @State var relatorio: Relatorio
    
    var body: some View {
        GeometryReader { view in
            VStack {
                Divider()
    
                HStack {
                    Text(relatorio.titulo)
                        .font(.custom("Quicksand-Bold", size: 16))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
    
                    Spacer()
    
                    Text(relatorio.precoAlvo)
                        .font(.custom("Quicksand-Bold", size: 16))
                        .foregroundColor(.green400)
                        .fontWeight(.bold)
                        .padding(.trailing, 15.0)
    
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding([.top, .leading], 15.0)
                
                HStack {
                    VStack {
                        Text("Criado: \(relatorio.dataPublicacao)")
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Text("Autor: \(relatorio.autor)")
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
                .padding(.top, 5.0)
            }
        }
        .frame(width: .infinity, height: 120, alignment: .leading)
    }
}

struct RelatoriosView_Previews: PreviewProvider {
    static var previews: some View {
        let relatorioTeste = Relatorio(id: 1, titulo: "Teste", precoAlvo: "999 BTC", dataPublicacao: "10.10.1990", autor: "Teste 123")
        
        RelatoriosView(relatorio: relatorioTeste)
            .previewLayout(.fixed(width: 400, height: 120))
    }
}

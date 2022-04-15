//
//  CardRetanguloView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 15/04/22.
//

import SwiftUI

struct CardRetanguloView: View {
    
    @State var cardRetangulo: CardRetangulo
    
    var body: some View {
       
        RoundedRectangle(cornerRadius: 15.0)
            .fill(cardRetangulo.corFundo)
            .overlay(
                VStack {
                    Text(cardRetangulo.titulo)
                        .font(.custom("Quicksand-Bold", size: 25))
                        .foregroundColor(cardRetangulo.corFonte)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                    Text(cardRetangulo.subTitulo)
                        .font(.custom("Quicksand-Medium", size: 10))
                        .foregroundColor(cardRetangulo.corFonte)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                }
            )
            .frame(width: 100, height: 120, alignment: .leading)
            .if(cardRetangulo.addBorda) { $0.addBorder(Color.black, cornerRadius: 10) }
            
           
        
    }
}

struct CardRetanguloView_Previews: PreviewProvider {
    static var previews: some View {
        
        let cardDemo = CardRetangulo(titulo: "Titulo", subTitulo: "Subtitulo", corFundo: Color.lightBlue, corFonte: Color.white)
        
        CardRetanguloView(cardRetangulo: cardDemo)
            .previewLayout(.fixed(width: 110, height: 130))
    }
}

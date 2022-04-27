//
//  CardTransacaoView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 31/03/22.
//

import SwiftUI

struct CardTransacaoView: View {
    
    var transacao: Transacao
    
    var body: some View {
        
        GeometryReader { view in
            VStack {
                HStack {
                    if transacao.tipoAcao == "add" {
                        Text("+")
                            .foregroundColor(.white)
                            .font(.custom("Quicksand-Regular", size: 50))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.lightBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding([.leading, .top], 20.0)
                    } else {
                        Image(systemName: "tray.full.fill")
                            .frame(width: 50, height: 50, alignment: .center)
                            .font(.custom("Quicksand-Regular", size: 50))
                            .foregroundColor(Color.lightBlue)
                            .padding([.leading, .top], 20.0)
                    }
                    
                    ZStack {
                        
                        //TODO: - Necessário calcular a distancia
                        let distancia = 180
                        
                        ForEach(Array(transacao.usuarios.enumerated()), id: \.offset) { index, urlUsuario in
                            let someUrl = URL(string: urlUsuario)
                            if let url = someUrl {
                                RemoteImageView(
                                  url: url,
                                  placeholder: {
                                    Image("placeholder")
                                  },
                                  image: {
                                      $0.resizable()
                                          .frame(width: 40, height: 40)
                                          .clipShape(Circle())
                                          .overlay(Circle().stroke(Color.grey200, lineWidth:2))
                                          .padding(.leading, CGFloat(distancia - (index * 60)))
                                      
                                  }
                                )
                            }
                        }
                    }
                    .frame(width: 150, alignment: .trailing)
                    .padding(.top, 20)
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text(transacao.titulo)
                    .foregroundColor(.darkBlue)
                    .fontWeight(.bold)
                    .font(.custom("Quicksand-Bold", size: 19))
                    .padding(.leading, 20.0)
                    .padding(.top, 10.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Text(transacao.subtitulo)
                    .foregroundColor(.grey500)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.custom("Quicksand-Bold", size: 15))
                    .padding(.leading, 20.0)
                    .padding(.bottom, 20.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .frame(width: 250, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 10))
            .background(Color.white)
        }
    }
}

struct CardTransacaoView_Previews: PreviewProvider {
    static var previews: some View {
        let usuarioTeste = ["https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814_960_720.jpg", "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814_960_720.jpg", "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814_960_720.jpg"]
        let transacaoTeste = Transacao(id: 1, titulo: "Teste", subtitulo: "Subtitulo Teste", tipoAcao: "Tipo ação", usuarios: usuarioTeste )
        
        CardTransacaoView(transacao: transacaoTeste)
            .previewLayout(.fixed(width: 250, height: 150))
    }
}




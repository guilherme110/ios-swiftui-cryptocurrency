//
//  TransacoesView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 12/04/22.
//

import SwiftUI
import WrappingHStack

struct TransacoesView: View {
    @State private var menuOpcoes: [Bool] = [true, false]
    
    var body: some View {
        GeometryReader { view in
            ScrollView {
                VStack {
                    Text("Transações")
                        .font(.custom("Quicksand-Bold", size: 25))
                        .foregroundColor(.darkBlue)
                        .fontWeight(.bold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                    HStack {
                        Button(action: {
                            self.menuOpcoes[0] = true
                            self.menuOpcoes[1] = false
                        }) {
                            VStack {
                                Text("Lançadas")
                                    .font(.custom("Quicksand-Bold", size: 18))
                                    .foregroundColor(menuOpcoes[0] ? .darkBlue : .grey500)
                                    .fontWeight(.bold)
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.lightBlue)
                                    .opacity(menuOpcoes[0] ? 1 : 0)
                            }
                            .frame(minWidth: 0, alignment: .center)
                            
                        }
                        
                        Button(action: {
                            self.menuOpcoes[0] = false
                            self.menuOpcoes[1] = true
                        }) {
                            VStack {
                                Text("Recebidas")
                                    .font(.custom("Quicksand-Bold", size: 18))
                                    .foregroundColor(menuOpcoes[1] ? .darkBlue : .grey500)
                                    .fontWeight(.bold)
                                
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.lightBlue)
                                    .opacity(menuOpcoes[1] ? 1 : 0)
                            }
                            .frame(minWidth: 0, alignment: .center)
                            .padding(.leading, 40.0)
                        }
                    }
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
                        .padding(.top, 15.0)
                    
                    Divider()
                
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
    }
}

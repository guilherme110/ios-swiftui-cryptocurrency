//
//  CardTransacaoView-ViewModel.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 16/04/22.
//

import Foundation

class CardTransacaoViewModel: ObservableObject {
    private let url = "http://localhost:3000/relatorios"
    
    
    
    func buscaRelatorios() {
        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
    }
}



//
//  Transacao.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 31/03/22.
//

import Foundation

struct TransacaoRealizada: Hashable, Codable, Identifiable {
    var id: Int
    var origem: String
    var autor: String
    var numeroTransacao: String
    var tipo: String
    var status: Int
}

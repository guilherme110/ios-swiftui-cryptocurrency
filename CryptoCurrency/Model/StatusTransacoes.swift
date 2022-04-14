//
//  EnumStatusTransacoes.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 13/04/22.
//

import Foundation

protocol NomeStatus  {
      var nomeStatus: String { get }
}

enum StatusTransacoes : Int, NomeStatus {
    case esperando = 1
    case emparelhamento = 2
    case emProgresso = 3
    case completa = 4
    case falha = 5

    var nomeStatus: String {
        switch self {
        case .esperando:
          return "Esperando"
        case .emparelhamento:
          return "Emparelhamento"
        case .emProgresso:
          return "Em Progresso"
        case .completa:
             return "Completa"
        case .falha:
             return "Falha"
      }
   }
}


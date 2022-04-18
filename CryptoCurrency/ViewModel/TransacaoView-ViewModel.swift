//
//  CardTransacaoView-ViewModel.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 16/04/22.
//

import Foundation
import Alamofire
import Combine

class TransacaoViewModel: ObservableObject {
    //MARK: - Published
    
    @Published var transacoesRealizadas: [TransacaoRealizada] = []
    @Published var chatListLoadingError: String = ""
    @Published var showAlert: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataTransacaoManager: TransacaoProtocol
    
    init( dataTransacaoManager: TransacaoProtocol = TransacaoService.shared) {
        self.dataTransacaoManager = dataTransacaoManager
        
        getTransacoesRealizadas()
    }
    
    func getTransacoesRealizadas() {
        dataTransacaoManager.buscaTransacoesRealizadas()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.transacoesRealizadas = dataResponse.value!
                }
            }.store(in: &cancellableSet)
    }
    
    func createAlert( with error: NetworkError ) {
        chatListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}



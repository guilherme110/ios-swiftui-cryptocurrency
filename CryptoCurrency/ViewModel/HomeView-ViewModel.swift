//
//  HomeView-ViewModel.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 18/04/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    //MARK: - Published
    
    @Published var listaRelatorios: [Relatorio] = []
    @Published var listaTransacoes: [Transacao] = []
    @Published var chatListLoadingError: String = ""
    @Published var showAlert: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataRelatorioManager: RelatorioProtocol
    var dataTransacaoManager: TransacaoProtocol
    
    init( dataRelatorioManager: RelatorioProtocol = RelatorioService.shared, dataTransacaoManager: TransacaoProtocol = TransacaoService.shared) {
        self.dataRelatorioManager = dataRelatorioManager
        self.dataTransacaoManager = dataTransacaoManager
        
        getRelatorios()
        getTransacoes()
    }
    
    func getRelatorios() {
        dataRelatorioManager.buscaRelatorios()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.listaRelatorios = dataResponse.value!
                }
            }.store(in: &cancellableSet)
    }
    
    func getTransacoes() {
        dataTransacaoManager.buscaTransacoes()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.listaTransacoes = dataResponse.value!
                }
            }.store(in: &cancellableSet)
    }
    
    func createAlert( with error: NetworkError ) {
        chatListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}

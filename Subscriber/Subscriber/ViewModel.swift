//
//  ViewModel.swift
//  Subscriber
//
//  Created by Frédéric Helfer on 04/11/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
//            .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                self.count += 1
                
                
                
                // To cancel when reach 10
//                if self.count >= 10 {
//                    for item in self.cancellables {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
}

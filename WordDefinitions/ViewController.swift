//
//  ViewController.swift
//  WordDefinitions
//
//  Created by Ali Elsokary on 12/07/2024.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let apiService = EntryServiceImpl()
    
    private var cancelable: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.dispatch(
            APIRouter.GetEntry(word: "beautiful"))
        .sink { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                print(error)
            }
        }
    receiveValue: { [weak self] entries in
        print(entries)
    }.store(in: &cancelable)
    }


}


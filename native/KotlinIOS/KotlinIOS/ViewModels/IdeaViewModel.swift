//
//  IdeaViewModel.swift
//  KotlinIOS
//
//  Created by Dmitri 222 on 10/11/19.


import Foundation
import SwiftUI
import Combine
import SharedCode

class IdeasViewModel : ObservableObject {
    
    @Published var ideas = [IdeaModelExt]()
    
    var ideasOriginal = [IdeaModel]()
    
    private let repository: IdeaRepository
    
    init(repository: IdeaRepository) {
        self.repository = repository
        fetch()
    }
    
    func fetch() {
        repository.fetchIdeas(success: { data in
            self.ideasOriginal = data
            self.ideasOriginal.forEach {
                var ideaExt = IdeaModelExt(id: Int($0.id), ideaModel: $0)
                self.ideas.append(ideaExt)
            }
            print(self.ideas)
        })
    }
    
    private var searchCancellable: Cancellable? {
           didSet { oldValue?.cancel() }
       }

       deinit {
           searchCancellable?.cancel()
       }

    
    func test(){
        
    }

    
    func search() {
      /*
        var urlComponents = URLComponents(string: "https://alphacapture.appspot.com/api/ideas")!
       

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [IdeaModelSwift].self, decoder: JSONDecoder())
           // .map { $0 }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
           // .sink(receiveValue: {p in print (p.count)})
           // .assign(to: \.ideas, on: self)
 
 */
    }
    
}

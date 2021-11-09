//
//  DemoViewModel.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class DemoViewModel: ViewModel, ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        let items: Observable<[SectionModel<String, DemoModel>]>
    }
    
    func transform(input: Input) -> Output {
        let items = Observable.just([
            SectionModel(model: "", items: [
                DemoModel(title: "A"),
                DemoModel(title: "B"),
                DemoModel(title: "C"),
                DemoModel(title: "D"),
                DemoModel(title: "E"),
                DemoModel(title: "f")
            ])
        ])
        return Output(items: items)
    }
}

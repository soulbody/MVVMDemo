//
//  ViewModelType.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import Foundation
import RxSwift
import RxCocoa

// 协议： 除基类ViewModel外所有ViewModel都需要遵守协议
protocol ViewModelType {
    // 输入事件
    associatedtype Input
    // 输出事件
    associatedtype Output

    // 函数中处理各种逻辑
    func transform(input: Input) -> Output
}

// 基类ViewModel， 所有的ViewModel都要继承它
class ViewModel: NSObject {
    
    // 页面loding
    let loading = ActivityIndicator()
    
    // 类型是Error，实际上是ApiError
    let error = ErrorTracker()

    override init() {
        super.init()

    }

}

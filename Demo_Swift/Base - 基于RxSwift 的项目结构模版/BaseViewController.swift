//
//  BaseViewController.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import UIKit
import RxSwift
import RxCocoa

protocol ViewModelProtocal: UIViewController {
    var viewModel: ViewModel? { get set }
}

class BaseViewController: UIViewController, ViewModelProtocal {
    var viewModel: ViewModel?
    
    let disposeBag = DisposeBag()
    
    init(viewModel: ViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
        bindViewModel()
    }
    
    deinit {
        print("\(type(of: self)): Deinited")
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("\(type(of: self)): Received Memory Warning")
    }
    
    // UI操作
    func makeUI() { }
    
    // ViewModel操作
    func bindViewModel() { }
    
}

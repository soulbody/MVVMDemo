//
//  BaseTableViewController.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import UIKit
import RxSwift
import RxCocoa

class BaseTableViewController: BaseViewController, UIScrollViewDelegate {
    
    let headerRefreshTrigger = PublishSubject<Void>()
    let footerRefreshTrigger = PublishSubject<Void>()
    let footerNoData = BehaviorRelay(value: false)

    let isHeaderLoading = BehaviorRelay(value: false)
    let isFooterLoading = BehaviorRelay(value: false)
    
    lazy var tableView: BaseTableView = {
        let tableView = BaseTableView(frame: CGRect(x: 0, y: 84, width: SCREEN_W, height: SCREEN_H), style: .plain)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.delegate = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        return tableView
    }()
    
    override func makeUI() {
        super.makeUI()
        view.addSubview(tableView)
    }
    
    override func bindViewModel() { }
}

// MARK: -- UITableViewDelegate

extension BaseTableViewController: UITableViewDelegate { }

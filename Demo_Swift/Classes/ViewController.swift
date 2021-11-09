//
//  ViewController.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

let SCREEN_W = UIScreen.main.bounds.size.width // 屏幕宽度
let SCREEN_H = UIScreen.main.bounds.size.height // 屏幕高度

class ViewController: BaseTableViewController {
    
    override func makeUI() {
        super.makeUI()
        tableView.rowHeight = 60
        tableView.register(DemoCell.self, forCellReuseIdentifier: "DemoCell")
        self.viewModel = DemoViewModel()
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? DemoViewModel else {
            return
        }
        
        let input = DemoViewModel.Input()
        let output = viewModel.transform(input: input)
        
        //创建数据源
        let dataSource = RxTableViewSectionedReloadDataSource
        <SectionModel<String, DemoModel>>(configureCell: {
            (ds, tv, ip, model) in
            guard let cell = tv.dequeueReusableCell(withIdentifier: "DemoCell") as? DemoCell else {
                return UITableViewCell()
            }
            cell.titleL.text = "我是：\(model.title)"
            return cell
        })
        
        //绑定数据
        output.items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}


//
//  BaseTableViewCell.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import Foundation
import UIKit
import RxSwift

// 基类TableViewCell， 所有的cell都要继承它
class BaseTableViewCell: UITableViewCell {

    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        // 为了释放监听信号
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          self.makeUI()
    }
    
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        makeUI()
    }
    
    // UI操作
    func makeUI() {
        contentView.backgroundColor = .white
    }

    // cell绑定CellViewModel
    func bind(to viewModel: BaseTableViewCellViewModel) { }
}

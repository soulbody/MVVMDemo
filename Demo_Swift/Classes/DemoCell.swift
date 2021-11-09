//
//  DemoCell.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import UIKit

class DemoCell: BaseTableViewCell {
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 20, width: SCREEN_W-40, height: 20)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func makeUI() {
        super.makeUI()
        contentView.addSubview(titleL)
    }
    
    override func bind(to viewModel: BaseTableViewCellViewModel) {
        super.bind(to: viewModel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

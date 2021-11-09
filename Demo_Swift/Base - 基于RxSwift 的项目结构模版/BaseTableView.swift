//
//  BaseTableView.swift
//  Demo_Swift
//
//  Created by 李彦海 on 2021/11/9.
//

import UIKit

class BaseTableView: UITableView {

    init() {
        super.init(frame: CGRect(), style: .grouped)
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    func makeUI() {
        backgroundColor = .white
        rowHeight = 45
        estimatedRowHeight = 0
        sectionHeaderHeight = 0
        sectionFooterHeight = 0
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        backgroundColor = .white
        showsVerticalScrollIndicator = false
        cellLayoutMarginsFollowReadableWidth = false
        keyboardDismissMode = .onDrag
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 0.01))
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 0.01))
    }
    
    public func scrollToBottom(animated: Bool = false) {
        let contentHeight = contentSize.height

        if #available(iOS 11.0, *) {
            performBatchUpdates(nil) { _ in
                self.scrollRectToVisible(CGRect(x: 0.0, y: contentHeight - 1.0, width: 1.0, height: 1.0), animated: animated)
            }
        } else {
            beginUpdates()
            self.scrollRectToVisible(CGRect(x: 0.0, y: contentHeight - 1.0, width: 1.0, height: 1.0), animated: animated)
            endUpdates()
        }
    }
}

//
//  SearchDisplayController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

final public class SearchDisplayController<T: SearchDisplayItem>: UITableViewController {
    
    // MARK: - Public Variables
    
    public var items: [T] = [] {
        didSet { tableView.reloadData() }
    }
    
    // MARK: - Private Variables
    
    private var didSelectItemHandler: (T) -> Void
    
    // MARK: - Life Cycle
    
    public init(didSelectItemHandler: @escaping (T) -> Void) {
        self.didSelectItemHandler = didSelectItemHandler
        super.init(style: .plain)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchDisplayItemCell.identifier, for: indexPath) as? SearchDisplayItemCell else { return UITableViewCell() }
        cell.setup(with: items[indexPath.row])
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItemHandler(items[indexPath.row])
    }
    
    public override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource =  self
        tableView.register(SearchDisplayItemCell.nib, forCellReuseIdentifier: SearchDisplayItemCell.identifier)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
}

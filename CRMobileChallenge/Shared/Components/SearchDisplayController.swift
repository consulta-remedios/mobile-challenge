//
//  SearchDisplayController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

final public class SearchDisplayController<T: SearchDisplayItem>: UITableViewController, UISearchResultsUpdating {
    
    public typealias SearchItemHandler = (_ term: String?, @escaping (_ items: [T]) -> Void) -> Void
    public typealias DidSelectItemHandler = (_ item: T) -> Void
    
    // MARK: - Public Variables
    
    public var items: [T] = [] {
        didSet { tableView.reloadData() }
    }
    
    // MARK: - Private Variables
    
    private var searchItemHandler: SearchItemHandler
    private var didSelectItemHandler: (_ item: T) -> Void
    
    // MARK: - Life Cycle
    
    public init(searchItemHandler: @escaping SearchItemHandler, didSelectItemHandler: @escaping DidSelectItemHandler) {
        self.searchItemHandler = searchItemHandler
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
    
    public func updateSearchResults(for searchController: UISearchController) {
        searchItemHandler(searchController.searchBar.text) { [weak self] items in
            self?.items = items
        }
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

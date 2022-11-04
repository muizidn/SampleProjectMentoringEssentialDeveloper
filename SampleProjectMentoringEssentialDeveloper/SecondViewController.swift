//
//  SecondViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

import UIKit

class SecondViewController: BaseViewController {

    private let table = UITableView()
    private let viewModel = SecondViewModel()
    
    private let safeIndex = SecondViewControllerSafeIndex()
    private let unsafeIndex = SecondViewControllerUnsafeIndex()
    
    private var generatedTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        
        safeIndex.viewModel = viewModel
        unsafeIndex.viewModel = viewModel
        
        table.frame = view.safeAreaLayoutGuide.layoutFrame
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let safeSwitch = UISwitch(frame: .zero)
        safeSwitch.addTarget(self, action: #selector(_safeSwitch), for: .valueChanged)
        safeSwitch.sendActions(for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: safeSwitch)
        viewModel.dataSource.observers.append { [weak self] in
            self?.table.backgroundView = nil
            self?.table.reloadData()
        }
        let label = UILabel()
        label.text = "Loading data in 1 second"
        label.textAlignment = .center
        table.backgroundView = label
        label.frame = table.bounds
        viewModel.itemsGenerated()
        
        generatedTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(_itemsGenerated), userInfo: nil, repeats: true)
    }
    
    @objc private func _itemsGenerated() {
        viewModel.itemsGenerated()
    }
    
    @objc private func _safeSwitch(_ s: UISwitch) {
        if s.isOn {
            table.dataSource = safeIndex
            table.delegate = safeIndex
        } else {
            table.dataSource = unsafeIndex
            table.delegate = unsafeIndex
        }
    }
}

final class SecondViewControllerSafeIndex: NSObject, UITableViewDataSource, UITableViewDelegate {
    var viewModel: SecondViewModel!
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.value[safe: section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /** NOTE
         Actual codebase contains a lot of nil check becuase access backing store directly
         We cannot safely access using indexPath because of the asynchronous mutation
         */
        guard let item = viewModel.dataSource.value[safe: indexPath.section]?[safe: indexPath.row] else { return UITableViewCell() }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.backgroundColor = .green
        
        cell.textLabel?.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(viewModel.dataSource.value.indices)[safe: section].map { "SECTION \($0)" }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.dataSource.value.indices.map { "SECTION \($0)" }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.dataSource.value[safe: indexPath.section]?[safe: indexPath.row]
        print("ITEM", item)
    }
}

final class SecondViewControllerUnsafeIndex: NSObject, UITableViewDataSource, UITableViewDelegate {
    var viewModel: SecondViewModel!
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.value[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.dataSource.value[indexPath.section][indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.backgroundColor = .red
        
        cell.textLabel?.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SECTION \(viewModel.dataSource.value.indices[section])"
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.dataSource.value.indices.map { "SECTION \($0)" }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.dataSource.value[indexPath.section][indexPath.row]
        print("ITEM", item)
    }
}


extension Array {
    subscript(safe index: Int) -> Element? {
        return count > index ? self[index] : nil
    }
}


final class ObservableProperty<Value> {
    init(value: Value) {
        self.value = value
    }
    
    var value: Value {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.observers.forEach { observer in
                    observer()
                }
            }
        }
    }
    
    var observers: [() -> Void] = []
}

class SecondViewModel {
    let dataSource: ObservableProperty<[[String]]> = .init(value: [])
    
    private var generateBigger = false
    
    func itemsGenerated() {
        DispatchQueue.main.async { [weak self] in
            Thread.sleep(forTimeInterval: 1)
            let count = (self?.generateBigger ?? false) ? 30 : 15
            self?.dataSource.value = (1...count)
                .map { _ in
                    (1...2).map {
                        "\(count) sections generated: current row \($0)"
                    }
                }
            self?.generateBigger.toggle()
        }
    }
}

//
//  NamesViewController.swift
//  PhotoBrowser
//
//  Created by Mithun Raj on 26/08/20.
//  Copyright © 2020 Mithun Raj. All rights reserved.
//

import Cocoa

class NamesViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
    var namesOfFlowers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath else {return}
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("jpeg") {
                let flowerName = item.components(separatedBy: ".").first ?? ""
                namesOfFlowers.append(flowerName)
            }
        }
    }
    
}

extension NamesViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return namesOfFlowers.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let view = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView
        view?.textField?.stringValue = namesOfFlowers[row]
        return view
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let splitViewVC = parent as? NSSplitViewController else { return }
        guard let photoVC = splitViewVC.children[1] as? PhotoViewController else { return }
        let flowerName = namesOfFlowers[tableView.selectedRow]
        photoVC.selectImage(imageToBeShown: flowerName)
    }
}

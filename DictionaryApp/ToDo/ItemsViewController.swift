////////////////////////////////////////////////////////////////////////////
//
// Copyright 2018 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import UIKit
import RealmSwift
import MarqueeLabel
import SnapKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let realm: Realm
    let items: Results<Item>
    var itemsSearch: Array<Item>

    var notificationToken: NotificationToken?
    var tableView = UITableView()
    var textSearch = UITextField()
    var searching = false
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let config = SyncUser.current?.configuration(realmURL: Constants.REALM_URL, fullSynchronization: true)
        self.realm = try! Realm(configuration: config!)
        self.items = realm.objects(Item.self).sorted(byKeyPath: "timestamp", ascending: false)
        self.itemsSearch = Array()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateStarRealm = formatter.date(from: "2020/11/03")!
        let day = 30 - Int((Date().timeIntervalSince1970 - dateStarRealm.timeIntervalSince1970) / 60 / 1440)
        title = "Things ToDo! \(day) ngày"
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
        self.navigationController?.navigationBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedNavigationBar(tapGestureRecognizer:))))
        
        textSearch.delegate = self
        textSearch.borderStyle = .roundedRect
        textSearch.placeholder = "Tìm kiếm"
        view.addSubview(textSearch)
        textSearch.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }
        textSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(textSearch.snp.bottom)
            make.leading.trailing.bottom.equalTo(view)
        }
        self.tableView.register(MyCellItem.self, forCellReuseIdentifier: "ItemCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftBarButtonDidClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(rightBarButtonDidClick))
        
        notificationToken = items.observe { [weak self] (changes) in
            let countHiragana = self?.items.filter({ (item) -> Bool in
                !item.hiragana.isEmpty
            }).count ?? 0
            let countKatakana = self?.items.filter({ (item) -> Bool in
                !item.katakana.isEmpty
            }).count ?? 0
            let countKanji = self?.items.filter({ (item) -> Bool in
                !item.kanji.isEmpty
            }).count ?? 0
            self?.textSearch.placeholder = "Tìm kiếm: ひらがな(\(countHiragana))  カタカナ(\(countKatakana))  漢字(\(countKanji))"

            if (!self!.searching) {
                guard let tableView = self?.tableView else { return }
                switch changes {
                case .initial:
                    // Results are now populated and can be accessed without blocking the UI
                    tableView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    // Query results have changed, so apply them to the UITableView
                    tableView.beginUpdates()
                    tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                    tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                         with: .automatic)
                    tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                    tableView.endUpdates()
                case .error(let error):
                    // An error occurred while opening the Realm file on the background worker thread
                    fatalError("\(error)")
                }
            }
        }
    }
    
    @objc func tappedNavigationBar(tapGestureRecognizer: UITapGestureRecognizer) {
        self.navigationController!.pushViewController(DrawViewController(), animated: true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.search(text: textField.text ?? "")
    }
    
    func search(text: String) {
        if (text != ""){
            searching = true
            self.itemsSearch = Array(realm.objects(Item.self).filter({ item -> Bool in
                item.tiengViet.lowercased().contains(text.lowercased()) ||
                item.phatAm.contains(text.lowercased()) ||
                item.tiengViet.folded.lowercased().contains(text.lowercased()) ||
                item.english.lowercased().contains(text.lowercased()) ||
                item.hiragana.contains(text) ||
                item.katakana.contains(text) ||
                item.kanji.contains(text)
            }))
        }else{
            searching = false
            self.itemsSearch = Array()
        }
        tableView.reloadData()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    @objc func leftBarButtonDidClick() {
        let item = Item()
        showPopup(item: item)
    }
    
    func showPopup(item: Item) {
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            
            let textFieldVietNam = alertController.textFields![0] as UITextField
            let textFieldEnglish = alertController.textFields![1] as UITextField
            let textFieldHiragana = alertController.textFields![2] as UITextField
            let textFieldKatakana = alertController.textFields![3] as UITextField
            let textFieldKanji = alertController.textFields![4] as UITextField
            let textFieldPhatAm = alertController.textFields![5] as UITextField

            
            try! self.realm.write {

                item.tiengViet = textFieldVietNam.text ?? ""
                item.english = textFieldEnglish.text ?? ""
                item.hiragana = textFieldHiragana.text ?? ""
                item.katakana = textFieldKatakana.text ?? ""
                item.kanji = textFieldKanji.text ?? ""
                item.phatAm = textFieldPhatAm.text ?? ""

                self.realm.add(item)
            }
            
            if (self.searching){
                self.search(text: self.textSearch.text ?? "")
            }
            // do something with textField
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "Tiếng Việt"
            textField.text = item.tiengViet
        })
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "English"
            textField.text = item.english
        })
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "Hiragana"
            textField.text = item.hiragana
        })
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "Katakana"
            textField.text = item.katakana
        })
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "Kanji"
            textField.text = item.kanji
        })
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.borderStyle = .roundedRect
            textField.placeholder = "Phát Âm"
            textField.text = item.phatAm
        })
        self.present(alertController, animated: true, completion: nil)

    }
    
    @objc func rightBarButtonDidClick() {
        let alertController = UIAlertController(title: "Logout", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes, Logout", style: .destructive, handler: {
            alert -> Void in
            SyncUser.current?.logOut()
            self.navigationController?.setViewControllers([WelcomeViewController()], animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? itemsSearch.count : items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? MyCellItem ?? MyCellItem(style: .default, reuseIdentifier: "ItemCell")

        cell.selectionStyle = .none
        let item = searching ? itemsSearch[indexPath.row] : items[indexPath.row]
        
        var text = ""
        if (!item.tiengViet.isEmpty){
            text += " - \(item.tiengViet)"
        }
        if (!item.english.isEmpty){
            text += " - \(item.english)"
        }
        if (!item.hiragana.isEmpty){
            text += " - \(item.hiragana)"
        }
        if (!item.katakana.isEmpty){
            text += " - \(item.katakana)"
        }
        if (!item.kanji.isEmpty){
            text += " - \(item.kanji)"
        }
        if (!item.phatAm.isEmpty){
            text += " 👉 \(item.phatAm)"
        }
        
        cell.lengthyLabel.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = searching ? itemsSearch[indexPath.row] : items[indexPath.row]
        showPopup(item: item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let item = searching ? itemsSearch[indexPath.row] : items[indexPath.row]
        try! realm.write {
            realm.delete(item)
        }

        if (self.searching){
            self.search(text: self.textSearch.text ?? "")
        }
    }


}

class MyCellItem: UITableViewCell {
    var lengthyLabel = MarqueeLabel.init(frame: CGRect(), duration: 8.0, fadeLength: 10.0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        lengthyLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(lengthyLabel)

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
            lengthyLabel.heightAnchor.constraint(equalToConstant: 30),
            lengthyLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            lengthyLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            lengthyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

public extension UITextField
{
    override var textInputMode: UITextInputMode?
    {
        switch self.placeholder {
        case "Hiragana", "Kanji", "Katakana":
            return UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage == "ja-JP" }) ?? super.textInputMode
        case "English":
            return UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage == "en-US" }) ?? super.textInputMode
        default:
            return UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage == "vi-VN" }) ?? super.textInputMode
        }
    }
}

extension String{
    var folded: String {
        return self.folding(options: .diacriticInsensitive, locale: nil)
                .replacingOccurrences(of: "đ", with: "d")
                .replacingOccurrences(of: "Đ", with: "D")
    }
}

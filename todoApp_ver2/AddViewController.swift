//
//  AddViewController.swift
//  todoApp_ver2
//
//  Created by Kozasa Mizuki on 2020/04/05.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

var todolist = [String]()
var categorylist = [String]()

class AddViewController: UIViewController {
    
    @IBOutlet weak var detail_textfield: UITextView!
    @IBOutlet weak var category_textfield: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    let list: [String] = ["On Business", "Housework", "Programming", "Entertainment", "Others"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detail_textfield.layer.borderColor = UIColor.lightGray.cgColor
        detail_textfield.layer.borderWidth = 1.0
        detail_textfield.layer.cornerRadius = 5.0
        detail_textfield.layer.masksToBounds = true

        // Do any additional setup after loading the view.
        
        
    //picker setting
    //-----------------------------------
        pickerView.delegate = self
        pickerView.dataSource = self
        let toolbar = UIToolbar(frame: CGRect(x: 150, y: 900, width: view.frame.size.width, height: 30))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spaceItem, doneItem], animated: true)
        category_textfield.inputView = pickerView
        category_textfield.inputAccessoryView = toolbar
    }
    
    @objc func done() {
        category_textfield.endEditing(true)
        category_textfield.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
    }
    //-----------------------------------
    
    
    
    @IBAction func cancelButton_clicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButton_clicked(_ sender: Any) {
        
        todolist.append(detail_textfield.text!)
        detail_textfield.text = ""
        UserDefaults.standard.set(todolist, forKey: "todolist")
        categorylist.append(category_textfield.text!)
        category_textfield.text = ""
        UserDefaults.standard.set(categorylist, forKey: "categorylist")
        
        self.performSegue(withIdentifier: "Back", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.category_textfield.text = list[row]
    }
    
}

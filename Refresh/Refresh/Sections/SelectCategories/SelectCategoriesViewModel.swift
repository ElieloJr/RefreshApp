//
//  SelectCategoriesViewModel.swift
//  Refresh
//
//  Created by Usr_Prime on 30/11/22.
//

import Foundation

protocol SelectCategoriesViewDelegate {
    func setOpacity(in index: IndexPath)
}

class SelectCategoriesViewModel {
    var delegate: SelectCategoriesViewDelegate?
    let categories: [Category] = Mock.categories
    var selectedCategories: [String] = []
    
    func addCategory(_ indexCategory: IndexPath) {
        let index = indexCategory.row
        var position = 0
        if true {
            for selectedCategory in selectedCategories {
                if selectedCategory != categories[indexCategory.row].name {
                    selectedCategories.append(categories[index].name)
                    print(selectedCategories)
                } else {
                    print("Remove -> \(selectedCategories[position])")
    //                selectedCategories.remove(at: position)
                }
                position = position + 1
            }
        }
        
    }
    
    func removeCategory(_ indexCategory: IndexPath) {
//        if selectedCategories.count != 0 {
//            for selectedCategory in selectedCategories {
//                let category: Category = categories[indexCategory.row]
////                if selectedCategory.name == category.name {
////
////                }
//            }
//        }
    }
}

//
//  SelectCategoriesViewController.swift
//  Refresh
//
//  Created by Usr_Prime on 29/11/22.
//

import RxSwift
import RxCocoa
import RxDataSources

class SelectCategoriesViewController: UIViewController {
    
    private lazy var selectCategoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width/2.5), height: (view.frame.width/2.4))
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.canConstraints()
        return collectionView
    }()
    
    private lazy var arrowView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.canConstraints()

        let subView = UIImageView()
        subView.tintColor = .white
        subView.image = UIImage(systemName: "arrow.right")
        subView.canConstraints()
        
        view.addSubview(subView)
        subView.centerY(view.centerYAnchor)
        subView.centerX(view.centerXAnchor)
        subView.height(of: 30)
        subView.width(of: 36)
        
        return view
    }()
    
    private lazy var letsGoLabel: UILabel = {
        let label = UILabel()
        label.text = "Vamos lá"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.canConstraints()
        return label
    }()
    
    private lazy var letsGoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.black.cgColor
        view.canConstraints()
        
        view.addSubview(letsGoLabel)
        letsGoLabel.centerY(view.centerYAnchor)
        letsGoLabel.leading(view.leadingAnchor, spacing: 20)
        
        view.addSubview(arrowView)
        arrowView.top(view.topAnchor)
        arrowView.trailing(view.trailingAnchor)
        arrowView.bottom(view.bottomAnchor)
        arrowView.width(of: 70)
        
        return view
    }()
    
    private let viewModel = SelectCategoriesViewModel()
    private var bag = DisposeBag()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
    }
    
    private func setupView() {
        setTitle("Categorias de Preferência")
        setBackground(.lightGray)
        
        addSubview(selectCategoriesCollectionView)
        selectCategoriesCollectionView.top(view.safeAreaLayoutGuide.topAnchor, spacing: 30)
        selectCategoriesCollectionView.leading(view.leadingAnchor, spacing: 30)
        selectCategoriesCollectionView.trailing(view.trailingAnchor, spacing: -30)
        selectCategoriesCollectionView.bottom(view.bottomAnchor, spacing: -50)
        
        addSubview(letsGoView)
        letsGoView.bottom(view.bottomAnchor, spacing: -70)
        letsGoView.leading(view.leadingAnchor, spacing: 30)
        letsGoView.trailing(view.trailingAnchor, spacing: -30)
        letsGoView.height(of: 60)
    }
    
    private func setupUI() {
        viewModel.delegate = self
        
        letsGoView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(callNextScreen(_:)))
        )
    }
    
    @objc func callNextScreen(_ sender: UITapGestureRecognizer) {
        print("--- Funciona")
    }
}

    // MARK: DELEGATE
extension SelectCategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.addCategory(indexPath)
        print("clicou")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Desclicou")
//        viewModel.removeCategory(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        setOpacity(in: indexPath)
        return collectionView.cellForItem(at: indexPath)?.layer.opacity == 0.4
    }
}

    // MARK: DATA SOURCE
extension SelectCategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionViewCell.identifier,
            for: indexPath) as? CategoryCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel.categories[indexPath.row])
        return cell
    }
}

    // MARK: PROTOCOL
extension SelectCategoriesViewController: SelectCategoriesViewDelegate {
    func setOpacity(in index: IndexPath) {
        let cell = selectCategoriesCollectionView.cellForItem(at: index)
        print("setOpacity")
        
        if cell?.layer.opacity == 1 {
            cell?.layer.opacity = 0.4
        } else {
            cell?.layer.opacity = 1
        }
    }
}

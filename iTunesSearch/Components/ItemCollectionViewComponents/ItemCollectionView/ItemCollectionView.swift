//
//  ItemCollectionView.swift
//  iTunesSearch
//
//  Created by Emircan Aydın on 26.10.2021.
//

import UIKit

class ItemCollectionView: GenericBaseView<ItemCollectionViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var componentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 50
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(ItemCollectionCellView.self, forCellWithReuseIdentifier: ItemCollectionCellView.identifier)
        temp.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return temp
    }()
    
    // MARK: - Override Functions
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addMajorViewComponents()
    }
    
    // MARK: - Private Functions
    private func addViewComponents() {
        addSubview(componentCollection)
        
        NSLayoutConstraint.activate([

            componentCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentCollection.topAnchor.constraint(equalTo: topAnchor),
            componentCollection.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    // MARK: - Public Functions
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.componentCollection.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ItemCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError("Please provide  registered cell items") }
            return cell
        }
        
        guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Please provide at least one item!")}
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCellView.identifier, for: indexPath) as? ItemCollectionCellView else { fatalError("Please provide  registered cell items")}
        cell.setData(by: data)
        return cell
    }
    
    // If loading cell is shown request more data
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            self?.delegate?.selectedItem(at: indexPath.row)
            cell?.isUserInteractionEnabled = true
        })
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ItemCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 180)
    }
}

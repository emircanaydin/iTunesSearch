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
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.keyboardDismissMode = .onDrag
        temp.register(ItemCollectionWrapperCellView.self, forCellWithReuseIdentifier: ItemCollectionWrapperCellView.identifier)
        temp.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        temp.layer.backgroundColor = ColorHelper.viewBackground.value.cgColor
        return temp
    }()
    
    private var emptyView: EmptyResultView!
    
    // MARK: - Override Functions
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupBackgroundView()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addViewComponents()
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
    
    private func setupBackgroundView() {
        emptyView = EmptyResultView()
        componentCollection.backgroundView = emptyView
    }
    
    private func emptyViewActivationControl() {
        emptyView.activationManager(by: self.delegate?.isDataEmpty(in: 0) ?? false)
    }
    
    // MARK: - Public Functions
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.emptyViewActivationControl()
            self.componentCollection.reloadData()
        }
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            
            guard self.delegate?.askNumberOfItem(in: 0) ?? 0 > 0 else { return }
            
            self.componentCollection.scrollToItem(at: IndexPath(row: 0, section: 0),
                                              at: .top,
                                        animated: true)
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
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionWrapperCellView.identifier, for: indexPath) as? ItemCollectionWrapperCellView else { fatalError("Please provide  registered cell items")}
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
        
        if isLoadingCell(for: indexPath) {
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        }
        
        let width = (UIScreen.main.bounds.width - 80) / 2
        return CGSize(width: width, height: 200)
    }
}

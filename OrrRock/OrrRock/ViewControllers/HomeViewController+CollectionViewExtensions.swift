//
//  HomeViewController+CollectionView.swift
//  OrrRock
//
//  Created by Park Sungmin on 2022/10/19.
//

// MARK: TODO
// 퀵 액션을 통해 앨범형/목록형 옵션 변환에 따른 HeaderView 높이 변경 구현 필요

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 디버깅을 위해 카드의 개수를 5로 지정해두었음.
        // 이후 동작 구현 시 카드 개수 지정을 위해 해당 값을 변경해주면 됨.
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCardCell", for: indexPath) as! HomeCollectionViewCardCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 카드 비율 가로세로 비율 1.33:1
        let width = view.bounds.width - 2 * HorizontalPaddingSize
        let height = width / 1.33
        
        return CGSize(width: Double(width), height: Double(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 카드 간 간격 16 지정
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // SafeArea의 Top 부터 CollectionView의 HeaderView 높이를 계산하면 됨
        // 앨범 형 / 목록 형에 따라 HeaderView의 높이가 달라져야함
        return CGSize(width: collectionView.frame.width, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: HomeCollectionViewHeaderCell.identifier,
                                                                   for: indexPath)
        } else {
            return UICollectionReusableView()
        }
    }
}

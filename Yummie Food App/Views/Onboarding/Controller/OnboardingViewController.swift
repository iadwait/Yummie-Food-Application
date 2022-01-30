//
//  OnboardingViewController.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit

/// This Class is for OnBoarding View
class OnboardingViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK:- Variable Declarations
    var arrSlideData:[OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == arrSlideData.count - 1 {
                btnNext.setTitle("Get Started", for: .normal)
            } else {
                btnNext.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: - View's Initialization Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.isUserInteractionEnabled = false
        getOnboardingData()
        configureCollectionView()
    }
    
    // MARK: - User Dfined Functions
    
    /// Function Call to get Onboarding Data
    func getOnboardingData() {
        arrSlideData = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of delicious dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared only by the best.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your order will be delivered instantly irrespective of your location anywhere around the world.", image: #imageLiteral(resourceName: "slide3")),
        ]
    }
    
    /// Function call to configure collection view
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
    //MARK: - IBActions
    
    /// Function call when user taps on Next Button
    /// - Parameter sender: UIButton
    @IBAction func btnNextTapped(_ sender: UIButton) {
        if currentPage == arrSlideData.count - 1 {
            // Already on Last Item
            // Push to Home Screen
            let homeNavigationController = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            homeNavigationController.modalPresentationStyle = .fullScreen
            homeNavigationController.modalTransitionStyle = .flipHorizontal
            self.present(homeNavigationController, animated: true, completion: nil)
        } else {
            currentPage = currentPage + 1
            // Scroll to next Page
            collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: .centeredHorizontally, animated: true)
            // Update Page Control
            pageControl.currentPage = currentPage
        }
    }
    
    //MARK: - User Defined Functions

}

//MARK: - Extensions

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSlideData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        let data = arrSlideData[indexPath.row]
        cell.setup(data: data)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

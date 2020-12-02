//
//  OnboardingViewController.swift
//  Trafel
//
//  Created by Yauheni Kozich on 23.11.20.
//

import UIKit

protocol OnboardingDelegate: class {
    func showMainTabBarController()
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLadel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        setupPageControl()
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    private func setupViews() {
        view.backgroundColor = .systemGroupedBackground
    }
    @IBAction func gettingStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: Segue.showLoginSingUp.rawValue, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.showLoginSingUp.rawValue {
            if let destenation = segue.destination as? LoginViewController {
                destenation.delegate = self
            }
        }
    }
    
    private func showCaption(atIndex index: Int) {
        let slide = Slide.collection[index]
        titleLadel.text = slide.title
        descriptionLabel.text = slide.description
    }
    private func setupPageControl() {
        pageControl.numberOfPages = Slide.collection.count
    }
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardengCollectionViewCell
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        pageControl.currentPage = index
    }
    
}
extension OnboardingViewController: OnboardingDelegate {
    func showMainTabBarController() {
        if let loginTabBarController = self.presentedViewController as? LoginViewController {
            loginTabBarController.dismiss(animated: true) {
                    PresenterManager.shared.show(vc: .mainTabBarController)
            }
        }
    }
}

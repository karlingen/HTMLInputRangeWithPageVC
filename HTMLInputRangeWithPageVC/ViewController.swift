//
//  ViewController.swift
//  HTMLInputRangeWithPageVC
//

import UIKit

class ViewController: UIViewController {
    
    private var pageController: UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private var pages: [UIViewController] = [
        ExampleWebViewViewController(),
        ExampleWebViewViewController(),
        ExampleWebViewViewController(),
        ExampleWebViewViewController(),
        ExampleWebViewViewController(),
        ExampleWebViewViewController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageController.dataSource = self
        pageController.delegate = self
        pageController.view.backgroundColor = .clear
        pageController.view.frame = CGRect(x:0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        
        pageController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
    }
    
}

extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.firstIndex(of: viewController)!
        guard currentIndex > 0 else {
            return nil
        }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.firstIndex(of: viewController)!
        guard currentIndex < pages.count - 1 else {
            return nil
        }
        
        return pages[currentIndex + 1]
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}


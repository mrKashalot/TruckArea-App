//
//  PageViewManual.swift
//  DRAWTEST
//
//  Created by Владислав on 25.01.2021.
//

import UIKit

class PageViewManual: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList: [UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "FirstPage")
        let vc2 = sb.instantiateViewController(withIdentifier: "SecondPage")
        let vc3 = sb.instantiateViewController(withIdentifier: "ThirdPage")
        let vc4 = sb.instantiateViewController(withIdentifier: "FourPage")
        let vc5 = sb.instantiateViewController(withIdentifier: "FivePage")
        let vc6 = sb.instantiateViewController(withIdentifier: "SixPage")
       
        
        return [vc1, vc2, vc3, vc4, vc5, vc6]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else {return nil}
        
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
}



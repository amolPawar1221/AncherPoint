//
//  ViewController.swift
//  AnchorPointDemo
//
//  Created by It Gurus Software on 12/02/18.
//  Copyright © 2018 iT Gurus Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let scrollView:UIScrollView =  {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    let contentView:UIView =  {
        let view = UIView()
        return view
    }()
    
    let redView:UIView =  {
        let view = UIView()
         view.backgroundColor = .red
        return view
    }()
    
    
    let blueView:UIView =  {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let purpleView:UIView =  {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    let stackSubView:UIView =  {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
   
    let stackSubView1:UIView =  {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
     lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.backgroundColor = self.stackSubView2.backgroundColor
        return stackView
    }()
    var stackSubView2:UIView =  {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
  var stackView1:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        
    }
    
    
    private func addSubViews() {
        [stackSubView,stackSubView1,stackSubView2].forEach {stackView.addArrangedSubview($0)}
        
        [redView,blueView,purpleView,stackView].forEach {contentView.addSubview($0)}
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.addConstrainst(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        contentView.addConstrainst(top: scrollView.topAnchor, bottom: scrollView.bottomAnchor, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor)
        let heightConstraints = contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        heightConstraints.priority = .init(250)
        heightConstraints.isActive = true
        
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        redView.addConstrainst(top: contentView.topAnchor, bottom:  nil, leading:  nil, trailing: contentView.trailingAnchor ,edge:.init(top:0, left: 16, bottom: 0, right: 0),size: .init(width: 100, height: 500))
        
        blueView.addConstrainst(top: redView.bottomAnchor, bottom: nil, leading: redView.leadingAnchor, trailing: redView.trailingAnchor ,edge: .init(top: 8, left: 0, bottom: 0, right: 0))
        blueView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 0.5).isActive = true
        purpleView.addConstrainst(top: contentView.topAnchor, bottom: blueView.bottomAnchor, leading: contentView.leadingAnchor, trailing: redView.leadingAnchor ,edge: .init(top: 0, left: 8, bottom: 0, right: 8))
        
        stackView.addConstrainst(top: purpleView.bottomAnchor, bottom: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor ,edge: .init(top: 8, left: 8, bottom: 0, right: 8),size: .init(width: 0, height: 100))
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        
    }

}
extension UIView {
    func addConstrainst(top:NSLayoutYAxisAnchor?,bottom:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,trailing:NSLayoutXAxisAnchor?,edge:UIEdgeInsets = .zero,size:CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant:edge.top).isActive = true
            
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant:-edge.bottom).isActive = true
        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant:edge.right).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant:-edge.left).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

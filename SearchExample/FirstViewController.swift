//
//  FirstViewController.swift
//  SearchExample
//
//  Created by 홍수만 on 2023/08/04.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //rootView를 변경해서 기존 상위뷰들이 지워질 때, viewDidDisappear, viewWillDisappear가 호출되나요? -> 호출된다!
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function)

    }
    //메모리에서 사라지나여?
    deinit{
        print("deinit")
        print("메모리에서 아웃")
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLaunched")
        
        print(UserDefaults.standard.bool(forKey: "isLaunched"))
    }

    @IBAction func mainButtonClicked(_ sender: Any) {
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LibraryCollectionViewController") as! LibraryCollectionViewController
        let nav = UINavigationController(rootViewController:  vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
}

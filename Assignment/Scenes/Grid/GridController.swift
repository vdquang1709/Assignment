//
//  GridController.swift
//  Assignment
//
//  Created by Vũ Duy Quang on 1/28/21.
//

import UIKit

class GridController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    internal let controlBtnList: [ControlButtonData] = [
        ControlButtonData(text: "GRID", image: Images.grid),
        ControlButtonData(text: "SAVE", image: Images.save),
        ControlButtonData(text: "GET VIDEO", image: Images.video),
        ControlButtonData(text: "SHARE", image: Images.share),
        ControlButtonData(text: "REMOVE ADS", image: Images.removeAds)
    ]
    
    internal var gridRenderType: RenderType = .type9
    internal var gridBtnImage: String = Images.grid2
    internal var gridImageData: [String] = []
    
    internal var dataSize: Int = 9
    
    @IBOutlet weak var controlsCollectionView: UICollectionView!
    @IBOutlet weak var statisticView: UIView!
    internal var imageGridCollectionView: UICollectionView!
    @IBOutlet weak var gridContainer: UIView!
    @IBOutlet weak var tagLine: UILabel!
    
    
    internal var gradientView: UIView!
    internal var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.gradientView.frame = self.gridContainer.bounds
        self.gradientLayer.frame = gradientView.bounds
    }
    
    internal func changeRenderType() {
        if self.gridRenderType == .type8 {
            self.gridRenderType = .type9
            self.dataSize = 9
            self.gridBtnImage = Images.grid2
        } else {
            self.gridRenderType = .type8
            self.dataSize = 8
            self.gridBtnImage = Images.grid
        }
        self.gridImageData = GridImageData.fetchData(size: self.dataSize)
        self.imageGridCollectionView.reloadData()
        self.controlsCollectionView.reloadData()
    }
    
    @IBAction func customizeYearTouch(_ sender: Any) {
        print("customize year")
    }
    
    @IBAction func settingsTouch(_ sender: UIButton) {
        let vc = SettingsController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

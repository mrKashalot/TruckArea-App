//
//  ViewController.swift
//  DRAWTEST
//
//  Created by Владислав on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableWorkLabel: UILabel!
    @IBOutlet weak var tableWorkView: UIView!
    @IBOutlet weak var voumeText: UILabel! //обьем вводимой фигуры
    @IBOutlet weak var squareText: UILabel! //площадь вводимой фигуры
    @IBOutlet weak var lenghtTextBlock: CustomTextField!//длинна вводимой фигуры
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var heightText: UITextField! //высота вводимой фигуры
    @IBOutlet weak var widthText: UITextField! //ширина вводимой фигруы
    @IBOutlet weak var trackExampleView: UIView!
    @IBOutlet weak var trackSquare: UILabel! //площадь прицепа
    @IBOutlet weak var trackHeight: UILabel! //высота прицепа
    @IBOutlet weak var trackVolume: UILabel! //общий объем прицепа
    @IBOutlet weak var ImageGreenSquare: UIImageView!
    @IBOutlet weak var truckViewZone: UIView!
    @IBOutlet weak var alphaMinus: ButtonStyle!
    @IBOutlet weak var alphaPlus: ButtonStyle!
    @IBOutlet weak var changeColorButton: ButtonStyle!
    @IBOutlet weak var Print: ButtonStyle!
    @IBOutlet weak var deleteZone: CustomLabel!
    @IBOutlet weak var heightButton: ButtonStyle!
    @IBOutlet weak var eraseButton: ButtonStyle!
    
    //вспомогательные перменные для кнопок/вьюх и звуков
    var newView = UIView()
    var viewLabel = UILabel()
    var sameBlocksCount: Int = 0
    var alphaValue: Float = 0
    var clickButton = SimpleSound(named: "chik")
    var trashSound = SimpleSound(named: "trashSound")
    
    //параметры груза
    var heightTextInt: Float = 0 //высота груза heightText
    var widthTextInt: Float = 0 //ширина груза widthText
    var lenghtTextInt: Float = 0 //длинна груза lenghtTextBlock
    
    //параметры фуры (real)
    var trackLenghtFloat: Float = 13.5
    var trackWidthFloat: Float = 2.45
    var trackHaightFloat: Float = 2.7
    
    //начальные значения уже посчитанные объема / высоты и площади прицепа
    var trackVolumeFloat: Float = 89.3025
    var trackSquareFloat: Float = 33.075
    var trackHeightFloat: Float = 2.7
    
    //вспомогательные переменные площади / объема и высоты блока
    var blockSquare: Float = 0
    var blockVolume: Float = 0
    var blockHeaight: Float = 0
    
    //перменная счетчика light
    var i: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //стратовое отображение объема/площади и высоты прицепа
        trackVolume.text = " V=\(89.3025)"
        trackSquare.text = " S=\(33.075)"
        trackHeight.text = " H=\(2.7)"
        trackSquare.textColor = .green
        trackVolume.textColor = .green
        trackHeight.textColor = .green
        
        //стартовое отображение объема и площади блока
        voumeText.text = " V=\(0.0)"
        squareText.text = " S=\(0.0)"
        voumeText.textColor = .green
        squareText.textColor = .green
        
    }
    
    func addNewView() {
        for _ in 0 ..< 1 {
            newView = UIView(frame: CGRect(x: 52, y: 294, width: Int(widthTextInt), height: Int(lenghtTextInt)))
            newView.backgroundColor = .random()
            self.view.addSubview(newView)
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheObject(recognizer:)))
            newView.addGestureRecognizer(panGestureRecognizer)
        }
    }
    
    //считаем парметры объема прицепа после добаления блока
    func newVolumeTrack() {
        if  let h1 = Float(heightText.text!),
            let w2 = Float(widthText.text!),
            let l3 = Float(lenghtTextBlock.text!) {
            blockVolume = h1 * w2 * l3
            voumeText.text = " V=\(blockVolume)"
        }
        trackVolumeFloat -= blockVolume
        trackVolume.text = " V=\(trackVolumeFloat)"
        if trackVolumeFloat <= 0 {
            trackVolume.textColor = .red
            truckViewZone.backgroundColor = .red
        } else {
            trackVolume.textColor = .green
            truckViewZone.backgroundColor = .white
        }
    }
    
    //считаем парметры площади прицепа после добаления блока
    func newSquareTrack() {
        if  let w2 = Float(widthText.text!),
            let l3 = Float(lenghtTextBlock.text!) {
            blockSquare = w2 * l3
            squareText.text = " S=\(blockSquare)"
        }
        trackSquareFloat -= blockSquare
        trackSquare.text = " S=\(trackSquareFloat)"
        if trackSquareFloat <= 0 {
            trackSquare.textColor = .red
            truckViewZone.backgroundColor = .red
        } else {
            trackSquare.textColor = .green
            truckViewZone.backgroundColor = .white
        }
    }
    
    //считаем парметры высоты прицепа после добаления блока
    func newHeightTrack() {
        if  let h1 = Float(heightText.text!) {
            blockHeaight = h1
        }
        trackHeightFloat -= blockHeaight
        trackHeight.text = " H=\(trackHeightFloat)"
        if trackHeightFloat <= 0 {
            trackHeight.textColor = .red
            truckViewZone.backgroundColor = .red
        } else {
            trackHeight.textColor = .green
            truckViewZone.backgroundColor = .white
        }
    }
    
    //условия и состояния нашего жеста!
    @objc func dragTheObject(recognizer: UIPanGestureRecognizer) {
        
        guard let newView = recognizer.view else { return }
        
        if recognizer.state == .began || recognizer.state == .changed {
            newView.alpha = 0.2
            
            let translation = recognizer.translation(in: self.view)
            
            newView.center = CGPoint(x: newView.center.x + translation.x, y: newView.center.y + translation.y)
            
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            if newView.frame.intersects(deleteZone.frame) {
                deleteZone.textColor = UIColor.red
                deleteZone.alpha = 1
            } else {
                deleteZone.textColor = UIColor.lightGray
                deleteZone.alpha = 0.2
            }
            
            
        } else if recognizer.state == .ended {
            newView.alpha = 1
            
            if newView.frame.intersects(deleteZone.frame) {
                UIView.animate(withDuration: 5, animations: { [self] in
                    self.newView.alpha = 0.0
                    newView.removeFromSuperview()
                    
                    //эксперимент!
                    trackVolumeFloat += blockVolume
                    trackSquareFloat += blockSquare
                    trackHeightFloat += blockHeaight
                    
                    trackHeight.text = " H=\(trackHeightFloat)"
                    trackSquare.text = " S=\(trackSquareFloat)"
                    trackVolume.text = " V=\(trackVolumeFloat)"
                    
                    
                })
                trashSound.play()
                deleteZone.textColor = UIColor.lightGray
                deleteZone.alpha = 0.2
            } else {
                print("No delete")
            }
        }
    }
    
    @IBAction func createButtonPress(_ sender: Any) {
        clickButton.play()
        
        //конвертируем вводимые переменные параметров блока для корректного отображения
        widthTextInt = (Float(widthText.text ?? "") ?? 0) * 44
        heightTextInt = (Float(heightText.text ?? "") ?? 0) * 44
        lenghtTextInt = (Float(lenghtTextBlock.text ?? "") ?? 0) * 44
        
        newSquareTrack()
        newVolumeTrack()
        
        //собираем из вводимых значений блок!
        addNewView()
    }
    
    @IBAction func alphaMinus(_ sender: Any) {
        newView.alpha -= 0.05
        clickButton.play()
    }
    
    @IBAction func alphaPlus(_ sender: Any) {
        newView.alpha += 0.05
        clickButton.play()
    }
    @IBAction func switchColorPress(_ sender: Any) {
        self.newView.backgroundColor = .random()
        clickButton.play()
    }
    
    @IBAction func printPress(_ sender: Any) {
        clickButton.play()
        i += 1
        if i % 2 == 0 {
            truckViewZone.alpha = 1
            ImageGreenSquare.alpha = 1
        } else {
            truckViewZone.alpha = 0.1
            ImageGreenSquare.alpha = 0.1
        }
        
    }
    
    @IBAction func manualButtonPress(_ sender: Any) {
        clickButton.play()
    }
    
    @IBAction func heightButtonPress(_ sender: Any) {
        clickButton.play()
        newHeightTrack()
    }
    
    @IBAction func eraseButtonPress(_ sender: Any) {
        trackVolumeFloat = 89.3025
        trackSquareFloat = 33.075
        trackHeightFloat = 2.7
        
        trackVolume.text = " V=\(89.3025)"
        trackSquare.text = " S=\(33.075)"
        trackHeight.text = " H=\(2.7)"
    }
}

//рандомный выбор цвета вьюхи!
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}

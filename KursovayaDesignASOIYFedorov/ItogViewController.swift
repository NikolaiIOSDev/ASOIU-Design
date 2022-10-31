//
//  ItogViewController.swift
//  KursovayaDesignASOIYFedorov
//
//  Created by Николай Федоров on 21.04.2022.
//

import UIKit

class ItogViewController: UIViewController {

    @IBOutlet var onButton: UIButton!
    @IBOutlet var repeatButton: UIButton!
    
    
    @IBOutlet var stopTimer: UIImageView!
    @IBOutlet var stopWater: UIImageView!
    
    @IBOutlet var allWater: UIImageView!
    @IBOutlet var waterNagrev: UIImageView!
    @IBOutlet var closeWater: UIImageView!
    
    @IBOutlet var nameTimeNagrev: UILabel!
    @IBOutlet var intTimeNagrev: UILabel!
    @IBOutlet var secondTimeNagrev: UILabel!
    
    @IBOutlet var tempWater: UILabel!
    @IBOutlet var volumeWater: UILabel!
    @IBOutlet var timerWater: UILabel!
    
    
    var timer=Timer()
    var second=0
    var total=59
    
    var timerTwo=Timer()
    var secondTwo=0
    var totalTwo=59
    
    var timerThree=Timer()
    var secondThree=0
    var totalThree=120
   

    
    var volumeWaterInt=2358{
        didSet{
            volumeWater.text="\(volumeWaterInt)"
        }
    }
    
    var timerInt=0{
        didSet{
            timerWater.text="\(timerInt)"
        }
    }
    
    var timeNagrevInt=0{
        didSet{
            intTimeNagrev.text="\(timeNagrevInt)"
        }
    }
    
    var rowTempWater:Double=20{
        didSet{
            tempWater.text="\(rowTempWater)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onButton.layer.cornerRadius=10
        repeatButton.layer.cornerRadius=10
        repeatButton.isHidden=true
        allWater.isHidden=true
        waterNagrev.isHidden=true
        closeWater.isHidden=true
        
        stopWater.isHidden=true
        stopTimer.isHidden=true

        nameTimeNagrev.isHidden=true
        intTimeNagrev.isHidden=true
        secondTimeNagrev.isHidden=true
       
    }
    
    @IBAction func onButtonAction(_ sender: Any) {
        timer.invalidate()
       timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
        
        timerTwo.invalidate()
        timerTwo=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goTwo), userInfo: nil, repeats: true)
        
        timerThree.invalidate()
        timerThree=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goThree), userInfo: nil, repeats: true)
        
       
        

}
    @objc func go(){
        
       if second<=total{
        
        allWater.isHidden=false
        second+=1
        
       } else{
        timer.invalidate()
        allWater.isHidden=true
        
    }
    }
    
    @objc func goTwo(){
        volumeWaterInt-=20
        timerInt+=1
       if secondTwo<totalTwo{
        rowTempWater=rowTempWater-0.5
        secondThree=secondThree*0
        timeNagrevInt=timeNagrevInt*0
        secondTwo+=1
        
       } else{
        timerTwo.invalidate()
        timerWater.text=String(59)
        volumeWater.text=String(1178)
        stopWater.isHidden=false
        closeWater.isHidden=false
        waterNagrev.isHidden=false
        stopTimer.isHidden=false
        nameTimeNagrev.isHidden=false
        intTimeNagrev.isHidden=false
        secondTimeNagrev.isHidden=false
        
    
    }
    }
    @objc func goThree(){
        let allert=UIAlertController(title: "Готово", message: "Вода нагрета", preferredStyle: .alert)
        let allertCancel=UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        allert.addAction(allertCancel)
        
    if secondThree<=totalThree{
        secondThree+=1
        timeNagrevInt+=1
        rowTempWater+=0.5
        if secondThree>120{
            present(allert, animated: true, completion: nil)
            repeatButton.isHidden=false
        }
    }
        
    

}
    @IBAction func repeatButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

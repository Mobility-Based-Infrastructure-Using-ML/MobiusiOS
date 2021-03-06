import UIKit
import FaceTrigger

class ViewController: UIViewController {
    
    @IBOutlet var previewContainer: UIView!
    @IBOutlet var logTextView: UITextView!
    
    var faceTrigger: FaceTrigger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logTextView.text = nil
        
        NotificationCenter.default.addObserver(self, selector: #selector(pause), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(unpause), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        faceTrigger = FaceTrigger(hostView: previewContainer, delegate: self)
        faceTrigger?.start()
    }
    
    @objc private func pause() {
        faceTrigger?.pause()
    }
    
    @objc private func unpause() {
        faceTrigger?.unpause()
    }
    
    private func updateLog(_ eventText: String) {
        
        DispatchQueue.main.async {
            let currentText = self.logTextView.text ?? ""
            self.logTextView.text = "\(eventText)\n\n\(currentText)"
        }
    }
    
    @IBAction func clearLogAction() {
        logTextView.text = nil
    }
}

extension ViewController: FaceTriggerDelegate {
    
    // smile
    func onSmileDidChange(smiling: Bool) {
        updateLog("onSmileDidChange \(smiling)")
    }
    
    func onSmile() {
        updateLog("smile")
    }
    
    func onBlinkLeftDidChange(blinkingLeft: Bool) {
        updateLog("onBlinkLeftDidChange \(blinkingLeft)")
    }
    
    // blink
    func onBlinkLeft() {
        updateLog("blink left")
    }
    
    func onBlinkRightDidChange(blinkingRight: Bool) {
        updateLog("onBlinkRightDidChange \(blinkingRight)")
    }
    
    func onBlinkRight() {
        updateLog("blink right")
    }
    
    func onBlinkDidChange(blinking: Bool) {
        updateLog("onBlinkDidChange \(blinking)")
    }
    
    func onBlink() {
        updateLog("blink")
    }
    
    // brow down
    func onBrowDownDidChange(browDown: Bool) {
        updateLog("onBrowDownDidChange \(browDown)")
    }
    
    func onBrowDown() {
        updateLog("brow down")
    }
    
    // brow up
    func onBrowUpDidChange(browUp: Bool) {
        updateLog("onBrowUpDidChange \(browUp)")
    }
    
    func onBrowUp() {
        updateLog("brow up")
    }
    
    // cheek puff
    func onCheekPuffDidChange(cheekPuffing: Bool) {
        updateLog("onCheekPuffDidChange \(cheekPuffing)")
    }
    
    func onCheekPuff() {
        updateLog("cheek puff")
    }
    
    // mouth pucker
    func onMouthPuckerDidChange(mouthPuckering: Bool) {
        updateLog("onMouthPuckerDidChange \(mouthPuckering)")
    }
    
    func onMouthPucker() {
        updateLog("mouth pucker")
    }
    
    // jaw open
    func onJawOpenDidChange(jawOpening: Bool) {
        updateLog("onJawOpenDidChange \(jawOpening)")
    }
    
    func onJawOpen() {
        updateLog("jaw open")
    }
    
    // jaw left
    func onJawLeftDidChange(jawLefting: Bool) {
        updateLog("onJawLeftDidChange \(jawLefting)")
    }
    
    func onJawLeft() {
        updateLog("jaw left")
    }
    
    // jaw right
    func onJawRightDidChange(jawRighting: Bool) {
        updateLog("onJawRightDidChange \(jawRighting)")
    }
    
    func onJawRight() {
        updateLog("jaw right")
    }
    
    // squint
    func onSquintDidChange(squinting: Bool) {
        updateLog("onSquintDidChange \(squinting)")
    }
    
    func onSquint() {
        updateLog("squint")
    }
}

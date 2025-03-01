protocol AdvanceLifeSupport{
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvanceLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport{
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic does chest compression, 30 per second.")
    }
}


class Doctor: AdvanceLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compression, 30 per second.")
    }
    func useStethescope(){
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        print("The surgeon does chest compression, 30 per second.")
    }
    func useElectricDrill(){
        print("Whirr...")
    }
}
let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

//
//  main.swift
//  swift-starter-week5
//
//  Created by 이범준 on 2022/01/29.
//

import Foundation

class Person {
    var name: String
    var height: Int
    
    init(name: String, height: Int) {
        self.name = name
        self.height = height
    }
}

enum Level {
    case A
    case B
    case C
}

protocol Talent {
    var singing: Level? { get set }
    var dancing: Level? { get set }
    var acting: Level? { get set }
}

protocol BadPersonality {
    var frequancyOfCoursing: Level? { get set }
}

class TalentedPerson: Person, Talent {
    var singing: Level?
    var dancing: Level?
    var acting: Level?
    
    init(name: String, height: Int,singing: Level, dancing: Level, acting: Level) {
        super.init(name: name, height: height)
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
    }
}

class TalentedPersonWithBadPersonality: Person, Talent, BadPersonality {
    var singing: Level?
    var dancing: Level?
    var acting: Level?
    var frequancyOfCoursing: Level?
    
    init(name: String, height: Int, singing: Level, dancing: Level, acting: Level, frequancyOfCoursing: Level) {
        super.init(name: name, height: height)
        self.singing = singing
        self.dancing = dancing
        self.acting = acting
        self.frequancyOfCoursing = frequancyOfCoursing
    }
}

struct AuditionManager {
    public private(set) var totalApplicantsList: [Person]
    private var passedApplicantsList: Array<Person> = Array<Person>()
    
    init(applicants: [Person]){
        totalApplicantsList = applicants
    }
    
    mutating func cast() {
        for applicant in totalApplicantsList {
            let distinctedTalentedPerson = applicant as? TalentedPerson
            let distinctedTalentedBadPerson = applicant as? TalentedPersonWithBadPersonality
            if distinctedTalentedPerson != nil || distinctedTalentedBadPerson != nil {
                
                if let talentedPerson = distinctedTalentedPerson {
                    if talentedPerson.singing == .A || talentedPerson.dancing == .A || talentedPerson.acting == .A {
                        passedApplicantsList.append(talentedPerson)
                    }
                }
             
                if let talentedBadPerson = distinctedTalentedBadPerson {
                    if talentedBadPerson.singing == .A || talentedBadPerson.dancing == .A || talentedBadPerson.acting == .A && talentedBadPerson.frequancyOfCoursing == .A {
                        passedApplicantsList.append(talentedBadPerson)
                    }
                }
            }
        }
    }
    
    func announcePassedApplicants() {
        print("---합격자 명단---")
        for pass in passedApplicantsList {
            print("\(pass.name)")
        }
        print("--------------")
        print("축하합니다!!")
    }
}

let yagom = TalentedPerson(name: "yagom", height: 100, singing: .B, dancing: .A, acting: .C)
let noroo = Person(name: "noroo", height: 1000)
let summer = TalentedPerson(name: "summer", height: 900, singing: .B, dancing: .B, acting: .B)
let coda = TalentedPerson(name: "coda", height: 200, singing: .A, dancing: .C, acting: .C)
let odong = TalentedPersonWithBadPersonality(name: "odong", height: 400, singing: .A, dancing: .A, acting: .A, frequancyOfCoursing: .A)
let mySon = Person(name: "nalgangdo", height: 10000)

var auditionManager: AuditionManager = AuditionManager(applicants: [yagom,noroo,summer,coda,odong])

auditionManager.cast()
auditionManager.announcePassedApplicants()

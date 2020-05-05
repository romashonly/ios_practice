//
//  Trick.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Trick: Object, Codable {
    
    dynamic var id: String = ""
    
    dynamic var name: String = "Trick"
    dynamic var complexity: Float = 0.0 {
        didSet {
            self.complexity = self.complexity < 0 ? 0 : self.complexity
        }
    }
    dynamic var stability: Int = 0 {
        didSet {
            self.stability = self.stability < 0 ? 0 : self.stability
        }
    }
    dynamic var tries: Int = 0
}

extension Trick: DTOProtocol {
    
    var dto: Any {
        
        return TrickDTO(id: self.id,
                        name: self.name,
                        complexity: self.complexity,
                        stability: self.stability,
                        tries: self.tries)
    }
}

enum SkateTricks: Int, CaseIterable {
    case Ollie = 0
    case Fakieollie
    case Nollie
    case Switchollie
    case Shoveit
    case Fakieshoveit
    case NollieFsshoveit
    case Switchshoveit
    case FsShoveit
    case FakeFsShoveit
    case NollieBsShoveit
    case SwitchFsShoveit
    case Bs180
    case Fakiebs180
    case Nolliefs180
    case Switchbs180
    case Fs180
    case Fakiefs180
    case NollieBs180
    case Switchfs180
    case Bsbigspin
    case Fakiebsbigspin
    case Nolliefsbigspin
    case Switchbsbigspin
    case Fsbigspin
    case Fakiefsbigspin
    case Nolliebsbigspin
    case Switchfsbigspin
    case Bs360
    case FakieBs360
    case NollieFs360
    case SwitchBs360
    case Fs360
    case FakieFs360
    case NollieBs360
    case SwitchFs360
    case KickFlip
    case FakieKickFlip
    case NolieKickFlip
    case VarialKickFlip
    case FakieVarialKickFlip
    case HeelFlip
    case FakieHeelFlip
    case NollieHeelFlip
    case SwitchHeelFlip
    case VarialHeelflip
    case FakieVariaHeelflip
    case BsKickflip
    case Fakiebskickglip
    case FsKickflip
    case FakieFsKickflip
    case BsHeelflip
    case FakieBsHeelflip
    case FsHeelflip
    case FakeFsHeelflip
    case CasperFlip
    case FakieCasperFlip
    case Hardflip
    case FakeHardFlip
    case InwardHeelFlip
    case FakeInwardHellflip
    case flip360
    case fakie360flip

    
    var parametrs: Trick {
        
        switch self {
        case .Ollie:
            return createTrick(name: "Ollie", complexity: 1.0, stability: 0, tries: 0)
        case .Fakieollie:
            return createTrick(name: "Fakie ollie", complexity: 1.2, stability: 0, tries: 0)
        case .Nollie:
            return createTrick(name: "Nollie", complexity: 1.5, stability: 0, tries: 0)
        case .Switchollie:
            return createTrick(name: "Switch ollie", complexity: 1.7, stability: 0, tries: 0)
        case .Shoveit:
            return createTrick(name: "Shove-it", complexity: 1.2, stability: 0, tries: 0)
        case .Fakieshoveit:
            return createTrick(name: "Fakie shove-it", complexity: 1.5, stability: 0, tries: 0)
        case .NollieFsshoveit:
            return createTrick(name: "Nollie Fs shove-it", complexity: 1.5, stability: 0, tries: 0)
        case .Switchshoveit:
            return createTrick(name: "Switch shove-it", complexity: 1.7, stability: 0, tries: 0)
        case .FsShoveit:
            return createTrick(name: "Fs Shove-it", complexity: 1.5, stability: 0, tries: 0)
        case .FakeFsShoveit:
            return createTrick(name: "Fake Fs Shove-it", complexity: 1.3, stability: 0, tries: 0)
        case .NollieBsShoveit:
            return createTrick(name: "Nollie Bs Shove-it", complexity: 1.5, stability: 0, tries: 0)
        case .SwitchFsShoveit:
            return createTrick(name: "Switch Fs Shove-it", complexity: 1.7, stability: 0, tries: 0)
        case .Bs180:
            return createTrick(name: "Bs 180", complexity: 2.0, stability: 0, tries: 0)
        case .Fakiebs180:
            return createTrick(name: "Fakie bs 180", complexity: 1.7, stability: 0, tries: 0)
        case .Nolliefs180:
            return createTrick(name: "Nollie fs 180", complexity: 2.3, stability: 0, tries: 0)
        case .Switchbs180:
            return createTrick(name: "Switch bs 180", complexity: 2.5, stability: 0, tries: 0)
        case .Fs180:
            return createTrick(name: "Fs 180", complexity: 2.0, stability: 0, tries: 0)
        case .Fakiefs180:
            return createTrick(name: "Fakie fs 180", complexity: 1.7, stability: 0, tries: 0)
        case .NollieBs180:
            return createTrick(name: " Nollie Bs 180", complexity: 2.3, stability: 0, tries: 0)
        case .Switchfs180:
            return createTrick(name: "Switch fs 180", complexity: 2.5, stability: 0, tries: 0)
        case .Bsbigspin:
            return createTrick(name: "Bs bigspin", complexity: 3.0, stability: 0, tries: 0)
        case .Fakiebsbigspin:
            return createTrick(name: "Fakie bs bigspin", complexity: 2.0, stability: 0, tries: 0)
        case .Nolliefsbigspin:
            return createTrick(name: "Nollie fs bigspin", complexity: 2.5, stability: 0, tries: 0)
        case .Switchbsbigspin:
            return createTrick(name: "Switch bs bigspin", complexity: 3.5, stability: 0, tries: 0)
        case .Fsbigspin:
            return createTrick(name: "Fs bigspin", complexity: 4.0, stability: 0, tries: 0)
        case .Fakiefsbigspin:
            return createTrick(name: "Fakie fs bigspin", complexity: 2.5, stability: 0, tries: 0)
        case .Nolliebsbigspin:
            return createTrick(name: "Nollie bs bigspin", complexity: 2.7, stability: 0, tries: 0)
        case .Switchfsbigspin:
            return createTrick(name: "Switch fs bigspin", complexity: 4.5, stability: 0, tries: 0)
        case .Bs360:
            return createTrick(name: "Bs 360", complexity: 4.0, stability: 0, tries: 0)
        case .FakieBs360:
            return createTrick(name: "Fakie Bs 360", complexity: 3.0, stability: 0, tries: 0)
        case .NollieFs360:
            return createTrick(name: "Nollie Fs 360", complexity: 3.5, stability: 0, tries: 0)
        case .SwitchBs360:
            return createTrick(name: "Switch Bs 360", complexity: 4.5, stability: 0, tries: 0)
        case .Fs360:
            return createTrick(name: "Fs 360", complexity: 4.0, stability: 0, tries: 0)
        case .FakieFs360:
            return createTrick(name: "Fakie Fs 360", complexity: 3.0, stability: 0, tries: 0)
        case .NollieBs360:
            return createTrick(name: "Nollie Bs 360", complexity: 3.5, stability: 0, tries: 0)
        case .SwitchFs360:
            return createTrick(name: "Switch Fs 360", complexity: 4.5, stability: 0, tries: 0)
        case .KickFlip:
            return createTrick(name: "KickFlip", complexity: 3.0, stability: 0, tries: 0)
        case .FakieKickFlip:
            return createTrick(name: "Fakie KickFlip", complexity: 3.3, stability: 0, tries: 0)
        case .NolieKickFlip:
            return createTrick(name: "Nolie KickFlip", complexity: 5.0, stability: 0, tries: 0)
        case .VarialKickFlip:
            return createTrick(name: "Varial KickFlip", complexity: 3.0, stability: 0, tries: 0)
        case .FakieVarialKickFlip:
            return createTrick(name: "Fakie Varial KickFlip", complexity: 3.0, stability: 0, tries: 0)
        case .HeelFlip:
            return createTrick(name: "HeelFlip", complexity: 3.0, stability: 0, tries: 0)
        case .FakieHeelFlip:
            return createTrick(name: "Fakie HeelFlip", complexity: 3.3, stability: 0, tries: 0)
        case .NollieHeelFlip:
            return createTrick(name: "Nollie HeelFlip", complexity: 4.0, stability: 0, tries: 0)
        case .SwitchHeelFlip:
            return createTrick(name: "Switch HeelFlip", complexity: 5.0, stability: 0, tries: 0)
        case .VarialHeelflip:
            return createTrick(name: "Varial Heelflip", complexity: 3.0, stability: 0, tries: 0)
        case .FakieVariaHeelflip:
            return createTrick(name: "Fakie Varia Heelflip", complexity: 3.0, stability: 0, tries: 0)
        case .BsKickflip:
            return createTrick(name: "Bs Kickflip", complexity: 4.0, stability: 0, tries: 0)
        case .Fakiebskickglip:
            return createTrick(name: "Fakie bs kickglip", complexity: 3.7, stability: 0, tries: 0)
        case .FsKickflip:
            return createTrick(name: "Fs Kickflip", complexity: 4.5, stability: 0, tries: 0)
        case .FakieFsKickflip:
            return createTrick(name: "Fakie Fs Kickflip", complexity: 4.0, stability: 0, tries: 0)
        case .BsHeelflip:
            return createTrick(name: "Bs Heelflip", complexity: 4.0, stability: 0, tries: 0)
        case .FakieBsHeelflip:
            return createTrick(name: "Fakie Bs Heelflip", complexity: 3.7, stability: 0, tries: 0)
        case .FsHeelflip:
            return createTrick(name: "Fs Heelflip", complexity: 4.5, stability: 0, tries: 0)
        case .FakeFsHeelflip:
            return createTrick(name: "Fake Fs Heelflip", complexity: 4.0, stability: 0, tries: 0)
        case .CasperFlip:
            return createTrick(name: "Casper Flip", complexity: 10.0, stability: 0, tries: 0)
        case .FakieCasperFlip:
            return createTrick(name: "Fakie Casper Flip", complexity: 10.0, stability: 0, tries: 0)
        case .Hardflip:
            return createTrick(name: "Hardflip", complexity: 5.0, stability: 0, tries: 0)
        case .FakeHardFlip:
            return createTrick(name: "Fake HardFlip", complexity: 5.0, stability: 0, tries: 0)
        case .InwardHeelFlip:
            return createTrick(name: "Inward HeelFlip", complexity: 5.0, stability: 0, tries: 0)
        case .FakeInwardHellflip:
            return createTrick(name: "Fake InwardHellflip", complexity: 5.0, stability: 0, tries: 0)
        case .flip360:
            return createTrick(name: "360 flip", complexity: 5.0, stability: 0, tries: 0)
        case .fakie360flip:
            return createTrick(name: "fakie 360 flip", complexity: 5.0, stability: 0, tries: 0)
        }
    }
    
    static var defaultSkateTrick: [Trick] {
        
        var trickArray = [Trick]()
        for trick in SkateTricks.allCases {
            trickArray.append(trick.parametrs)
        }
        
        return trickArray
    }
    
    func createTrick(name: String, complexity: Float, stability: Int, tries: Int) -> Trick {
        
        let trick = Trick()
        trick.id = UUID().uuidString
        trick.name = name
        trick.complexity = complexity
        trick.stability = stability
        trick.tries = tries
        
        return trick
    }
}

enum SportType: String {
    case none = ""
    case skate = "Skate"
    case scoot = "Scoot"
    case bmx = "BMX"
    
    var image: UIImage? {
         return UIImage(named: "Registration/Sports/\(self.rawValue)")
    }
    
    var text: String {
        return self.rawValue
    }
    
    var tricks: [Trick] {
        switch self {
        case .skate:
            return SkateTricks.defaultSkateTrick
        default:
            return []
        }
    }
}

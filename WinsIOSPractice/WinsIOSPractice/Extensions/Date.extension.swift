//
//  Date.extension.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    static let failDate = Date(timeIntervalSince1970: 0 )
    
    
    // --------------------------------------
    
    static var now:Date {
        return Date().addingSecounds( TimeZone.current.secondsFromGMT() )
    }
    
    
    // --------------------------------------
    
    static var ts:Int64 { return Date().ts }

    // --------------------------------------

    static var srvDeltaTS:Int64 = 0
    
    // ------------------------------------------------------------------------------------------------
    
    static var srvTS:Int64  { return Int64( Int64( Date().timeIntervalSince1970 * 1000 ) + Date.srvDeltaTS ) }
    var srvTS:Int64  { return Int64( Int64( self.timeIntervalSince1970 * 1000 ) + Date.srvDeltaTS ) }

    // ------------------------------------------------------------------------------------------------
    
    static var srvTsRounded:Int64  { return Int64( floor( Double( Date.srvTS ) / 1000 ) * 1000 ) }
    
    // ISO8601 Parser --------------------------------------------------------------------------------
    
    private static var ISO8601components:DateComponents = DateComponents( timeZone: TimeZone.current )
    
    private static let ISO8601year = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let ISO8601month = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let ISO8601day = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let ISO8601hour = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let ISO8601minute = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let ISO8601second = UnsafeMutablePointer<Float>.allocate(capacity: 1)
    
    // ------------------------------------------------------------------------------------------------
    
    init(_ val: Any? ) {
        guard let value = val else { self = Date.failDate; return }
        
        switch value {
        case let wrapedValue as Date:
            self = wrapedValue
            
        case let wrapedValue as TimeInterval:
            self = Date( timeIntervalSince1970: wrapedValue )
            
        case let wrapedValue as Int:
            self = Date( wrapedValue )
            
        case let wrapedValue as String:
            self = Date( wrapedValue )
            
        case let wrapedValue as [String:Any]:
            self = Date( wrapedValue )
            
            
        default:
            self = Date.failDate
        }
        
    }
    
    // ------------------------------------------------------------------------------------------------
    
    init(_ dict: [String:Any] ) {
        
        if let ts = dict["ts"] as? Int {
            self = Date( ts )
            return
        }
        
        if let date = dict["dt"] as? Date {
            self = date
            return
        }
        
        if let isoStr = dict["dt"] as? String {
            self = Date( isoStr )
            return
        }
        
        self = Date.failDate
    }
    
    // ------------------------------------------------------------------------------------------------
    
    init(_ ts: Int) {
        self = Date( Int64(ts) )
    }
    
    init(_ dayOffset:Int, in dayKey:Int ) {
        self = Date(dayKey).addingTimeInterval(TimeInterval(dayOffset))
    }
        
    // ------------------------------------------------------------------------------------------------
    
    
    var ts:Int64  {
        return Int64( self.timeIntervalSince1970 * 1000 )
    }
    

    
    // --------------------------------------------
    
    func addingDays(_ days:Int ) -> Date {
        return self.addingTimeInterval( TimeInterval( days * 86_400 ) )
    }
    
    func addingMinutes(_ min:Int ) -> Date {
        return self.addingTimeInterval( TimeInterval( min * 60 ) )
    }
    
    func addingSecounds(_ secs:Int ) -> Date {
        return self.addingTimeInterval( TimeInterval( secs ) )
    }
    
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var string: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd:MM:yyyy"
        let string = formatter.string(from: self)
        return string
    }
    
}


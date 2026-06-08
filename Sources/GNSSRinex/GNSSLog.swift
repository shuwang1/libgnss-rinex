//
//  GNSSLog.swift
//  GNSSRinex
//

import Foundation
import Logging

public enum GNSSLogLevel: Int, Comparable {
    case none = 0
    case error = 1
    case warn = 2
    case info = 3
    case debug = 4
    case trace = 5
    
    public static func < (lhs: GNSSLogLevel, rhs: GNSSLogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var swiftLogLevel: Logger.Level {
        switch self {
        case .none, .error: return .error
        case .warn: return .warning
        case .info: return .info
        case .debug: return .debug
        case .trace: return .trace
        }
    }
}

public struct GNSSLog {
    
    /// The global logger instance
    nonisolated(unsafe) public static var logger = Logger(label: "GNSSRinex")
    
    /// Global log level filter
    nonisolated(unsafe) public static var level: GNSSLogLevel = .trace {
        didSet {
            logger.logLevel = level.swiftLogLevel
        }
    }
    
    /// Main trace function
    public static func trace(_ lvl: GNSSLogLevel, file: String = #file, line: Int = #line, _ message: @autoclosure () -> String) {
        if lvl > level || lvl < .error { return }
        
        let msg = message()
        logger.log(level: lvl.swiftLogLevel, Logger.Message(stringLiteral: msg), file: file, function: "", line: UInt(line))
    }
    
    /// Dump a matrix to log
    public static func traceMat(_ lvl: GNSSLogLevel, A: [Double], n: Int, m: Int, p: Int, q: Int, file: String = #file, line: Int = #line) {
        if lvl > level || lvl < .error { return }
        
        var output = ""
        for i in 0..<n {
            for j in 0..<m {
                let value = A[i + j * n]
                // Basic formatting replacing %*.*f
                let formatString = String(format: " %\(p).\(q)f", value)
                output += formatString
            }
            output += "\n"
        }
        
        logger.log(level: lvl.swiftLogLevel, Logger.Message(stringLiteral: output), file: file, function: "", line: UInt(line))
    }
    
    /// Dump raw bytes
    public static func traceB(_ lvl: GNSSLogLevel, p: [UInt8], file: String = #file, line: Int = #line) {
        if lvl > level || lvl < .error { return }
        
        var output = ""
        for i in 0..<p.count {
            output += String(format: "%02X%@", p[i], (i % 8 == 7) ? " " : "")
        }
        output += "\n"
        
        logger.log(level: lvl.swiftLogLevel, Logger.Message(stringLiteral: output), file: file, function: "", line: UInt(line))
    }
}

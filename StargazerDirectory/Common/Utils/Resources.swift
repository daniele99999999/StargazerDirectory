//
//  Resources.swift
//  StargazerDirectory
//
//  Created by daniele on 15/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public enum Resources
{
    public enum AppInfo
    {
        public static var appVersion: String
        {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        }
        
        public static var appBuildVersion: String
        {
            return (Bundle.main.object(forInfoDictionaryKey: (kCFBundleVersionKey as String?) ?? "")) as? String ?? ""
        }
        
        public static var appBundleName: String
        {
            return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        }
        
        public static var appDisplayName: String
        {
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? Resources.AppInfo.appBundleName
        }
        
        public static var appExecutableName: String
        {
            return Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
        }
        
        public static var appProcessName: String
        {
            return ProcessInfo.processInfo.processName
        }
        
        public static var appFileName: String
        {
            return FileManager.default.displayName(atPath: Bundle.main.bundlePath)
        }
        
        public static var appBundleIdentifier: String
        {
            return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
        }
    }
}



//
//  ViewController.swift
//  Task
//
//  Created by Kartheek Repakula on 04/03/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDeviceInfo()
    }
    
    func getDeviceInfo() {
        let device = UIDevice.current
        
        // Model Name and Model Number
        let modelName = device.model
        let modelNumber = device.localizedModel
        
        // iOS Version
        let iOSVersion = device.systemVersion
        
        // Storage (in bytes)
        if let totalSpace = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemSize] as? Int64 {
            let storageGB = Double(totalSpace) / 1_073_741_824 // Convert bytes to GB
            print("Total Storage: \(storageGB) GB")
        }
        
        // Battery Health (Maximum Capacity)
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryHealth = UIDevice.current.batteryState == .unknown ? "N/A" : "\(Int(UIScreen.main.brightness * 100))%"
        
        // Battery Level (Current charging level)
        let batteryLevel = "\(Int(device.batteryLevel * 100))%"
        
        // Camera MegaPixel and Aperture
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
        if let device = deviceDiscoverySession.devices.first {
            let cameraMegaPixel = device.activeFormat.maxExposureDuration
            let cameraAperture = device.activeFormat.maxISO
            print("Camera MegaPixel: \(cameraMegaPixel), Camera Aperture: \(cameraAperture)")
        }
        
        // Processor (CPU) Information
        let processorInfo = ProcessInfo.processInfo.processorCount
        
        // GPU Information
        let gpuInfo = UIDevice.current.model // Not precise but gives some GPU info
        
        // IMEI (Not available)
        // IMEI is not accessible through public APIs in iOS for privacy and security reasons
        
        let systemName = device.systemName
        // Print or use retrieved information as needed
        print("Model Name: \(modelName), Model Number: \(modelNumber)")
        print("System Name: \(systemName)")
        print("iOS Version: \(iOSVersion)")
        print("Battery Health: \(batteryHealth), Battery Level: \(batteryLevel)")
        print("Processor Count: \(processorInfo)")
        print("GPU Information: \(gpuInfo)")
    }
}






//
//  NetworkInfoService.swift
//  StarBrowserProj
//
//  Created by Островский Лев Владимирович on 23.04.2023.
//

import Foundation
import CoreTelephony
import SystemConfiguration
import CoreLocation

class NetworkInfoService: NSObject, CLLocationManagerDelegate {
    static let shared = NetworkInfoService()

    var connectionType: String = "--"
    var currentIP: String = "--"
    var providerName: String = "--"
    var location: String = "--"

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func getInfo() {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        providerName = carrier?.carrierName ?? "Unknown"
        print("Mobile network provider: \(providerName)")

        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        if flags.contains(.isWWAN) {
            connectionType = "Cellular"
        } else if flags.contains(.reachable) {
            connectionType = "WiFi"
        } else {
            connectionType = "No Connection"
        }
        print(connectionType)

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return }
        guard let firstAddr = ifaddr else { return }
        for addr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let flags = Int32(addr.pointee.ifa_flags)
            let addrFamily = addr.pointee.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) && (flags & (IFF_UP|IFF_RUNNING)) == (IFF_UP|IFF_RUNNING) {
                guard let addr = addr.pointee.ifa_addr.withMemoryRebound(to: sockaddr_in.self, capacity: 1, { $0.pointee }) as Optional else { continue }
                let ip = String(cString: inet_ntoa(addr.sin_addr), encoding: .ascii)!
                    
                if ip.hasPrefix("127.") { continue }
                if ip.hasPrefix("fe80:") { continue }
                if ip.hasPrefix("::1") { continue }
                    
                currentIP = ip
                print("Current IP Address: \(currentIP)")
            }
        }
        freeifaddrs(ifaddr)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                self.location = placemark.country ?? ""
                print(self.location)
            }
        }
    }
}

import Foundation
import UIKit

internal class SpeedTestCustomService {
    static let shared = SpeedTestCustomService()
    
    private var speedTest = SpeedTest()
    private var hostDownloadService = CustomHostDownloadService()
    private var hostUploadService = CustomHostUploadService()
    
    private var chosenHost: SpeedTestHost?
    private var isTesting: Bool = false
    
    
    private init() {}
    
    /// resets all host and services
    func resetData(){
        speedTest = SpeedTest()
        hostDownloadService = CustomHostDownloadService()
        hostUploadService = CustomHostUploadService()
        chosenHost = nil
    }
    /// finds best hosts nearby and compares them by ping, returns host with it's info
    func findBestHostForTest(bestHost: @escaping (_ host: SpeedTestHost)-> (),
                             error: @escaping (_ error: String) -> ()){
        if isTesting == false {
            isTesting = true
            getBestHost { (bestHostFound, ping) in
                self.chosenHost = bestHostFound
                bestHost(bestHostFound)
                self.isTesting = false
            } failure: { (hostError) in
                error(hostError)
                self.isTesting = false
            }
        } else {
            error(SpeedTestCustomState.isTesting.localizedDescription)
        }

    }
    /// ping chosen host, returns ping in ms
    func makePingTest(ping: @escaping (_ ping: Int)-> (),
                      error: @escaping (_ error: String) -> ()){
        guard let chosenHost = chosenHost else {
            return
        }
        guard let URLToPing = URL(string: "http://\(chosenHost.host)") else {
            return
        }
        URLToPing.ping(timeout: 10) { (result) in
            switch result {
            case .success(let value):
                ping(value)
                UserDefaults.ping = value
                print("Ping updated = \(UserDefaults.ping)ms")
            case .failure(let pingError):
                error(pingError.localizedDescription)
            }
        }
    }
    /// download speed test, returns speed in result and get closure for update current and average speeds
    func makeDownloadTestWithHost(currentSpeed: ((Speed) -> Void)? = nil,
                                  avgSpeed: ((Speed) -> Void)? = nil,
                                  testResult: @escaping (_ speedTestResult: (Speed?, SpeedTestCustomState)) -> Void){
        guard let chosenHost = chosenHost else {
            testResult((nil, .isTesting))
            return
        }
        var avgSpeedRecord: Speed?
        hostDownloadService.test(chosenHost.url,
                                 fileSize: 100000000,
                                 timeout: 30)
        { (current, avg) in
            currentSpeed?(current)
            avgSpeedRecord = avg
            avgSpeed?(avg)
        } final: { (result) in
            switch result {
            case .success(let value):
                testResult((value, .successful))
            case .failure(_):
                testResult((avgSpeedRecord, .testError))
            }
        }
    }
    /// upload speed test, returns speed in result and get closure for update current and average speeds
    func makeUploadTestWithHost(currentSpeed: ((Speed) -> Void)? = nil,
                                avgSpeed: ((Speed) -> Void)? = nil,
                                testResult: @escaping (_ speedTestResult: (Speed?, SpeedTestCustomState)) -> Void){
        guard let chosenHost = chosenHost else { return }
        hostUploadService.test(chosenHost.url, fileSize: 100000000, timeout: 30)
        { (current, avg) in
            currentSpeed?(current)
            avgSpeed?(avg)
        } final: { (result) in
            switch result {
            case .success(let value):
                testResult((value, .successful))
            case .failure(_):
                testResult((nil, .testError))
            }
        }
    }
    /// finds best host
    private func getBestHost(bestHost: @escaping (_ bestHost: (SpeedTestHost, Int)) -> (),
                             failure: @escaping (_ errorMessage: String) -> ()){
        speedTest.findBestHost(from: 30, timeout: 30) { (result) in
            switch result {
            case .success(let host):
                bestHost(host)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
/// enum for speed test return states
enum SpeedTestCustomState: Error {
    case isTesting
    case unknownError
    case testError
    case successful
    
    public var localizedDescription: String? {
        switch self {
        case .isTesting:
            return "Test already running"
        case .unknownError:
            return "Unknown error"
        case .testError:
            return "Test error"
        case .successful:
            return "Successfull"
        }
    }
}

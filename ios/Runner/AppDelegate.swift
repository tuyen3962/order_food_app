import UIKit
import Flutter
import HealthKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let healthStore = HKHealthStore()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      if let controller = window?.rootViewController as? FlutterViewController {
                  let stepCountChannel = FlutterMethodChannel(
                      name: "step_count_background",
                      binaryMessenger: controller.binaryMessenger
                  )
                  
                  stepCountChannel.setMethodCallHandler({
                      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                      guard call.method == "startStepCountTracking" else {
                          result(FlutterMethodNotImplemented)
                          return
                      }
                      
                      self?.startStepCountTracking(result: result)
                  })
              }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func startStepCountTracking(result: @escaping FlutterResult) {
            guard HKHealthStore.isHealthDataAvailable() else {
                result(false)
                return
            }
            
            let types = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
            healthStore.requestAuthorization(toShare: nil, read: types) { (success, error) in
                guard success else {
                    result(false)
                    return
                }
                
                self.startBackgroundStepCountUpdates()
                result(true)
            }
        }
        
        private func startBackgroundStepCountUpdates() {
            let observerQuery = HKObserverQuery(
                sampleType: HKObjectType.quantityType(forIdentifier: .stepCount)!,
                predicate: nil
            ) { [weak self] (query, completionHandler, error) in
                guard let self = self else { return }
                
                self.fetchStepCount { stepCount in
                    self.sendStepCountToFlutter(stepCount: stepCount)
                }
                
                completionHandler()
            }
            
            healthStore.execute(observerQuery)
            healthStore.enableBackgroundDelivery(for: .stepCount, frequency: .immediate) { _, _ in }
        }
        
        private func fetchStepCount(completion: @escaping (Int) -> Void) {
            let calendar = Calendar.current
            let now = Date()
            let startOfDay = calendar.startOfDay(for: now)
            
            let predicate = HKQuery.predicateForSamples(
                withStart: startOfDay,
                end: now,
                options: .strictStartDate
            )
            
            let query = HKStatisticsQuery(
                quantityType: HKObjectType.quantityType(forIdentifier: .stepCount)!,
                quantitySamplePredicate: predicate,
                options: .cumulativeSum
            ) { _, result, error in
                guard let result = result, let sum = result.sumQuantity() else {
                    completion(0)
                    return
                }
                
                let stepCount = Int(sum.doubleValue(for: HKUnit.count()))
                completion(stepCount)
            }
            
            healthStore.execute(query)
        }
        
        private func sendStepCountToFlutter(stepCount: Int) {
            guard let controller = window?.rootViewController as? FlutterViewController else {
                return
            }
            
            let stepCountChannel = FlutterMethodChannel(
                name: "step_count_background",
                binaryMessenger: controller.binaryMessenger
            )
            
            stepCountChannel.invokeMethod("onStepCountUpdate", arguments: stepCount)
        }

}

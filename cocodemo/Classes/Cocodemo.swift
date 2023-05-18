import Foundation

public class FetchDetails {
    
    public init(){
    }
    public func printDetails() {
        let details = FetchMetrices().getMetrices()
        print("final details-->", details)
    }
    
}

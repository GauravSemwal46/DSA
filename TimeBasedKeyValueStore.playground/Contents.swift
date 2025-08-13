import UIKit

// ------------------------------------------------------------------------------------ //
/* Implement a time-based key-value data structure that supports:

Storing multiple values for the same key at specified time stamps
Retrieving the key's value at a specified timestamp
Implement the TimeMap class:

TimeMap() Initializes the object.
void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
String get(String key, int timestamp) Returns the most recent value of key if set was previously called on it and the most recent timestamp for that key prev_timestamp is less than or equal to the given timestamp (prev_timestamp <= timestamp). If there are no values, it returns "".
Note: For all calls to set, the timestamps are in strictly increasing order. */
// ------------------------------------------------------------------------------------ //



// ------------------------------------------------------------------------------------ //
// Brute Force Approach
// Time Complexity - O(1) for set, O(n) for get
// Space Complexity - O(m*n) m = Unique timestamp, n = total no. of keys
// ------------------------------------------------------------------------------------ //

class TimeMapBruteForce {
    private var keystore: [String: [Int: [String]]]
    
    init() {
        self.keystore = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if keystore[key] == nil {
            keystore[key] = [:]
        }
        if keystore[key]![timestamp] == nil {
            keystore[key]![timestamp] = []
        }
        keystore[key]![timestamp]!.append(value)
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let timemap = keystore[key] else { return "" }
        
        var seen = 0
        
        for time in timemap.keys {
            if time <= timestamp {
                seen = max(seen, time)
            }
        }
        return seen == 0 ? "" : timemap[seen]!.last!
    }
}

// ------------------------------------------------------------------------------------ //
// TEST SOLUTION USING BRUTE FORCE APPROACH
/*var timeMap = TimeMapBruteForce();
timeMap.set("alice", "happy", 1);  // store the key "alice" and value "happy" along with timestamp = 1.
timeMap.get("alice", 1);           // return "happy"
timeMap.get("alice", 2);           // return "happy", there is no value stored for timestamp 2, thus we return the value at timestamp 1.
timeMap.set("alice", "sad", 3);    // store the key "alice" and value "sad" along with timestamp = 3.
timeMap.get("alice", 3);           // return "sad"*/
// ------------------------------------------------------------------------------------ //

// ------------------------------------------------------------------------------------ //
// Binary Search (Sorted Map)
// Time Complexity - O(1) for set, O(logn) for get
// Space Complexity - O(m*n) m = Unique timestamp, n = total no. of keys
// ------------------------------------------------------------------------------------ //
class TimeMapBinarySearch {
    private var m: [String: [(Int, String)]]
    
    init() {
        self.m = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if m[key] == nil { m[key] = [] }
        
        m[key]!.append((timestamp,value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let timestamps = m[key] else { return "" }
        
        var left = 0, right = timestamps.count - 1
        var result = ""
        
        while left <= right {
            let mid = (left + right) / 2
            if timestamps[mid].0 <= timestamp {
                result = timestamps[mid].1
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}

// ------------------------------------------------------------------------------------ //
// TEST SOLUTION USING BINARY SEARCH
/*var timeMap = TimeMapBinarySearch();
timeMap.set("alice", "happy", 1);  // store the key "alice" and value "happy" along with timestamp = 1.
timeMap.get("alice", 1);           // return "happy"
timeMap.get("alice", 2);           // return "happy", there is no value stored for timestamp 2, thus we return the value at timestamp 1.
timeMap.set("alice", "sad", 3);    // store the key "alice" and value "sad" along with timestamp = 3.
timeMap.get("alice", 3);           // return "sad"*/
// ------------------------------------------------------------------------------------ //

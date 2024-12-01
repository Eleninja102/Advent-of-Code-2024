import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
//  var firstEntries: [Int] {data.split(separator: "\n").compactMap {
//    $0.split(separator: "   ").first!.map(Int.init)
//  }
//  }
  var firstEntriesAsInt: [Int] {data.split(separator: "\n").compactMap {
    $0.split(separator: "   ").first.flatMap { Int($0) }
  }}
  var secondEntriesAsInt: [Int] {data.split(separator: "\n").compactMap {
    $0.split(separator: "   ").last.flatMap { Int($0) }
  }}
  
  var entities2: [[Int]] {
    data.split(separator: "\n").map {
      return $0.split(separator: "   ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let x = firstEntriesAsInt.sorted()
    let y = secondEntriesAsInt.sorted()
    
    return zip(x, y).reduce(0) { $0 + abs($1.0 - $1.1) }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let secondEntriesCounts = Dictionary(secondEntriesAsInt.map { ($0, 1) }, uniquingKeysWith: +)
    let firstEntriesCounts = Dictionary(firstEntriesAsInt.map { ($0, 1) }, uniquingKeysWith: +)
    
    let solution = firstEntriesCounts.reduce(0) { result, entry in
        let (key, value) = entry
        let secondCount = secondEntriesCounts[key] ?? 0
        return result + (secondCount * key * value)
    }
  
    return solution
       
  }
}

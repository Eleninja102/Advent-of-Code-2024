import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  //  var firstEntries: [Int] {data.split(separator: "\n").compactMap {
  //    $0.split(separator: "   ").first!.map(Int.init)
  //  }
  //  }
//  var firstEntriesAsInt: [Int] {
//    data.split(separator: "\n")
//      .lazy
//      .compactMap { $0.split(separator: "   ").first }
//      .compactMap { Int($0) }
//      .sorted()
//  }
//
//  var secondEntriesAsInt: [Int] {
//    data.split(separator: "\n")
//      .lazy
//      .compactMap { $0.split(separator: "   ").last }
//      .compactMap { Int($0) }
//      .sorted()
//  }

  var entities2: [[Int]] {
    data.split(separator: "\n").map {
      return $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    
    return entities2.count{enity in
      enity.adjacentPairs().allSatisfy{(num1, num2) in
        (1...3 ~= (num2-num1))
      }
      ||
      enity.adjacentPairs().allSatisfy{(num1, num2) in
        (1...3 ~= (num1-num2))
      }
    }
  }
  //390

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var coun = 0;
    for entity in entities2{
      for (index, _) in entity.enumerated(){
        var temp = entity;
        temp.remove(at: index)
        print(temp)
        if(temp.adjacentPairs().allSatisfy{(num1, num2) in
          (1...3 ~= (num2-num1))
        }
        ||
           temp.adjacentPairs().allSatisfy{(num1, num2) in
          (1...3 ~= (num1-num2))
        }){
          coun += 1;
          break;
        }
      }
    }
    

    return coun;

  }
}


import Algorithms
import RegexBuilder


struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [Substring] {
    data.split(separator: "\n")
//      .flatMap{ line in line.split(separator: "mul")}
  }
  

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
//    let entities = ["(123,456)", "(78,910)", "(11,22)"] // Example input
    
    let number1 = Reference<Int>()
    let number2 = Reference<Int>()
    let mulStatement = Regex {
       "mul("
      TryCapture(as: number1) {
           OneOrMore(.digit)
       }transform: { match in
           Int(match)
       }
      ","
       TryCapture(as: number2) {
           OneOrMore(.digit)
       } transform: { match in
         Int(match)
       }
       ")"
   }
   
    var solution = 0
    for section in entities{
      let matches = section.matches(of: mulStatement)
      for match in matches{
        if(1...3 ~= (match[number1].words.count) && 1...3 ~= (match[number2].words.count)){
          solution += (match[number1] * match[number2]);
          // print("Number: \(match[number1]),\(match[number2]) \((match[number1] * match[number2]))")

        }
      }
    }
            
    // Calculate the sum of the first set of input data
//    entities.first?.reduce(0, +) ?? 0
    return solution
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let number1 = Reference<Int>()
    let number2 = Reference<Int>()
    let mulStatement = Regex {
       "mul("
      TryCapture(as: number1) {
           OneOrMore(.digit)
       }transform: { match in
           Int(match)
       }
      ","
       TryCapture(as: number2) {
           OneOrMore(.digit)
       } transform: { match in
         Int(match)
       }
       ")"
   }
    let choices = Regex {
      ChoiceOf {
        "do()"
        "don't()"
        mulStatement
      }
       
   }
    var enabled = true;
    var solution = 0
    for section in entities{
      section.matches(of: choices).forEach{ match in
        // print(match.output)
        switch match.output{
        case ("don't()", _, _):
          enabled = false;
        case ("do()", _, _):
          enabled = true;
        case (_, let num1?, let num2?) where enabled:
          if(1...3 ~= (num1.words.count) && 1...3 ~= (num2.words.count)){
            solution += (match[number1] * match[number2]);
          }
        default:
          break;
        }
      
        
//
//          solution += (match[number1] * match[number2]);
//          print("Number: \(match[number1]),\(match[number2]) \((match[number1] * match[number2]))")
//
//        }
      }
    }
    
    // Sum the maximum entries in each set of data
    return solution
  }

}

//168078817
//168078817
//168078817
//

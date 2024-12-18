import Algorithms
import Collections
import Foundation


struct Day05: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String

	// Splits input data into its component parts and convert from string.
	
	var ruleDict: Dictionary<Int, Set<Int>> {
		let parts = data.components(separatedBy: "\n\n").filter { !$0.isEmpty }
		let sortedRules: Dictionary<Int, Set<Int>>  = parts[0].components(separatedBy: "\n").reduce(into: Dictionary<Int, Set<Int>>()) { ruleSet, rule in
			
			let x = rule.components(separatedBy: "|").map{Int($0)}
			let firstNumber = x[0]!
			let secondNumber = x[1]!
			if(ruleSet[firstNumber] == nil){
				ruleSet[firstNumber] = []
			}
			ruleSet[firstNumber]!.insert(secondNumber)
				
		}
	
		return sortedRules;
	}
	
	var ruleSet: OrderedSet<Int>{
		let parts = data.components(separatedBy: "\n\n").filter { !$0.isEmpty }
		print("HELLO!")

		let sortedRules: OrderedSet<Int> = parts[0].components(separatedBy: "\n").reduce(into: OrderedSet<Int>()) { ruleSet, rule in
			
			let x = rule.components(separatedBy: "|").map{Int($0)}
			let firstNumber = x[0]!
			let secondNumber = x[1]!
			
			if(firstNumber == 12){
				print("12", secondNumber, ruleSet)
			}
			
			if let firstNumIndex = ruleSet.firstIndex(of: firstNumber){
				if let secondNumIndex = ruleSet.firstIndex(of: secondNumber){
					if(secondNumIndex - firstNumIndex > 0){
						return
					}
					let subset = ruleSet[secondNumIndex..<firstNumIndex]
					ruleSet.removeSubrange(secondNumIndex..<firstNumIndex)
//					ruleSet.append(contentsOf: subset)
					if let newFirstNumIndex = ruleSet.firstIndex(of: firstNumber){
						for (index, num) in subset.enumerated(){
							ruleSet.insert(num, at: newFirstNumIndex+1+index)
						}
					}
					return
				}
				ruleSet.insert(secondNumber, at: firstNumIndex+1)
				return
			}else if let secondNumIndex = ruleSet.firstIndex(of: secondNumber){
				ruleSet.insert(firstNumber, at: secondNumIndex)
				return
			}else{
				ruleSet.insert(firstNumber, at: 0)
				ruleSet.insert(secondNumber, at: 1)
				return
			}
		}
		return sortedRules;
	}
	var entities: [[Int]] {
		let parts = data.components(separatedBy: "\n\n").filter { !$0.isEmpty }

		let section: [[Int]] = parts[1].split(separator: "\n").map{$0.split(separator: ",").map{Int($0)!}}
		return section
	}


	func part1() -> Any {
		// Calculate the sum of the first set of input data
		let rules = self.ruleDict;
		let printing = OrderedSet(entities);
		
		var result = 0


		x: for paperPrinting in printing {
			for (ind, testNumber) in paperPrinting.enumerated(){
				let previosNumbers = OrderedSet(paperPrinting[0..<ind])
				if let setRules = rules[testNumber]{
					if !previosNumbers.isDisjoint(with: setRules) {
						continue x;
					}
				}
			}
			let middleIndex = Int(ceil(Double(paperPrinting.count-1) / Double(2)))

			result += paperPrinting[middleIndex]
		}
		return result
	}
	
	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		// Calculate the sum of the first set of input data
		let rules = self.ruleDict;
		let printing = OrderedSet(entities)
		
		var result = 0

		
		x: for var paperPrinting in printing{
			var broken = false;
			var changes = 0
			repeat{
				changes = 0;
				for (ind, testNumber) in paperPrinting.enumerated(){
					let previosNumbers = OrderedSet(paperPrinting[0..<ind])
					if let setRules = rules[testNumber]{
						if !previosNumbers.isDisjoint(with: setRules) {
							broken = true;
						}
					}
					if rules[testNumber] != nil{
						for intersec in  previosNumbers.intersection(rules[testNumber]!){
							let item = paperPrinting.remove(at: paperPrinting.firstIndex(of: intersec)!) // Remove the item
							paperPrinting.insert(item, at: paperPrinting.firstIndex(of: testNumber)!+1)
							changes+=1
						}
					}
				}
			}while(changes != 0)

			let middleIndex = Int(ceil(Double(paperPrinting.count-1) / Double(2)))

			result += broken ? paperPrinting[middleIndex]: 0;
		}
		return result
	}
}

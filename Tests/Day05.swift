import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day05Tests {
  // Smoke test data provided in the challenge question
	let testData =
 """
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"""
//  """
// 79|26
// 75|21
// 75|86
// 74|69
// 74|86
// 74|75
// 35|62
// 35|74
// 35|47
// 35|57
// 86|28
// 86|95
// 86|53
// 86|99
// 86|46
// 28|12
// 28|25
// 28|65
// 28|83
// 28|79
// 28|43
// 15|52
// 15|18
// 15|33
// 15|67
// 15|88
// 15|57
// 15|26
// 95|72
// 95|97
// 95|12
// 95|15
// 95|74
// 95|85
// 95|82
// 95|73
// 
// 95,82
// """


  @Test func testPart1() async throws {
    let challenge = Day05(data: testData)
    #expect(String(describing: challenge.part1()) == "143")
  }

  @Test func testPart2() async throws {
    let challenge = Day05(data: testData)
    #expect(String(describing: challenge.part2()) == "123")
  }
}

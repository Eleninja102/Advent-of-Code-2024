import Algorithms

struct Day04: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
	var entities: (dataSet: [[Substring]], columnCount: Int, rowCount: Int) {
		
		let x = data.split(separator: "\n")
		let y = x.map{$0.split(separator: "")}
		
		return (y, columnCount: y[0].count, rowCount: x.count)
	}
	

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
	  let lookup: Array<Substring> = ["X", "M", "A", "S"];
    // Calculate the sum of the first set of input data
//	  print(table)
	  var count = 0
//	  print(entities.dataSet, entities.rowCount, entities.columnCount);
//	  for (row) in entities.dataSet{
//		  for section in row.windows(ofCount: 4) where section.contains(lookup){
//			  count += 1;
//		  }
//		  for section in row.reversed().windows(ofCount: 4) where section.contains(lookup){
//			  count += 1;
//		  }
//	  }
	  
	  let verticalArray = (0..<entities.dataSet[0].count).lazy.map { col in
		  entities.dataSet.map { row in
			  row[col]
		  }.lazy
	  }
	  
	  for (row) in verticalArray{
		  for section in row.windows(ofCount: 4){
			  if(section.contains(lookup) || section.reversed().contains(lookup)){
				  count += 1;
			  }
		  }
	  }

	  for (rowIndex, row) in entities.dataSet.enumerated(){
		  for section in row.windows(ofCount: 4){
			  if(section.contains(lookup) || section.reversed().contains(lookup)){
				  count += 1;
			  }
		  }
		  
		  for (columnIndex, letter) in row.enumerated() where letter == "X" || letter == "S"{
			  if (rowIndex+3 < entities.rowCount && columnIndex+3 < entities.columnCount){
				  let downSlant = [letter, entities.dataSet[rowIndex+1][columnIndex+1], entities.dataSet[rowIndex+2][columnIndex+2], entities.dataSet[rowIndex+3][columnIndex+3]]
				  if downSlant.contains(lookup) || downSlant.reversed().contains(lookup) {
					  count += 1;
//					  print("\(downSlant) exists in the section or in the reversed section.")
				  }
			  }
		  }
		  for (columnIndex, letter) in row.enumerated() where letter == "X" || letter == "S"{
			  if (rowIndex+3 < entities.rowCount && columnIndex-3 >= 0){
				  let downSlant = [letter, entities.dataSet[rowIndex+1][columnIndex-1], entities.dataSet[rowIndex+2][columnIndex-2], entities.dataSet[rowIndex+3][columnIndex-3]]
				  if downSlant.contains(lookup) || downSlant.reversed().contains(lookup) {
					  count += 1;
//					  print("\(downSlant) exists in the section or in the reversed section.")
				  }
			  }
		  }
	  }
	  
	  return count;
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
	  let lookup: Set<Substring> = ["M", "A", "S"];

	  var count = 0
	  for (rowIndex, row) in entities.dataSet.lazy.enumerated(){
		  guard rowIndex != 0, rowIndex != entities.dataSet.count - 1 else {
				 continue
		 }
		  for (columnIndex, letter) in row.enumerated() where letter == "A" && columnIndex != 0 && columnIndex != row.count-1 {
			  let downSlant: Set<Substring> = [entities.dataSet[rowIndex-1][columnIndex-1], letter, entities.dataSet[rowIndex+1][columnIndex+1]]
			  let upSlant: Set<Substring> = [entities.dataSet[rowIndex-1][columnIndex+1], letter, entities.dataSet[rowIndex+1][columnIndex-1]]
			  
			  if downSlant == lookup && upSlant == lookup{
				  count += 1
			  }
		  }
	  }
	  
	  return count;
  }
}


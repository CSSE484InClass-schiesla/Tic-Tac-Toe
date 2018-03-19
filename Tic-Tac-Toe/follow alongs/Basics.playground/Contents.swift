var myVariable: Double
myVariable = 50
let myConstant = 42
//myConstant = 50
type(of: myVariable)
myVariable
print(myVariable)
let scores = [75, 52, 93, 87, 41, 83]
type(of: scores)
var totalPassing = 0
for score in scores {
    if score >= 60 {
        totalPassing += 1
    }
}

for i in 0..<scores.count {
    if scores[i] >= 60 {
        totalPassing += 1
    }
}
totalPassing

print("\(totalPassing) passed out of \(scores.count) students.")

import Foundation

let problem = [
    "1.  This is a numbered list of twelve statements.",
    "2.  Exactly 3 of the last 6 statements are true.",
    "3.  Exactly 2 of the even-numbered statements are true.",
    "4.  If statement 5 is true, then statements 6 and 7 are both true.",
    "5.  The 3 preceding statements are all false.",
    "6.  Exactly 4 of the odd-numbered statements are true.",
    "7.  Either statement 2 or 3 is true, but not both.",
    "8.  If statement 7 is true, then 5 and 6 are both true.",
    "9.  Exactly 3 of the first 6 statements are true.",
    "10. The next two statements are both true.",
    "11. Exactly 1 of statements 7, 8 and 9 are true.",
    "12. Exactly 4 of the preceding statements are true."]

let statements:[([Bool] -> Bool)] = [
    { s in s.count == 12 },
    { s in s.drop(6).filter({ $0 }).count == 3 },
    { s in s.drop(1).stride(2).filter({ $0 }).count == 2 },
    { s in s[4] ? (s[5] && s[6]) : true },
    { s in s.drop(1).take(3).filter({ $0 }).count == 0 },
    { s in s.stride(2).filter({ $0 }).count == 4 },
    { s in [s[1], s[2]].filter({ $0 }).count == 1 },
    { s in s[6] ? (s[4] && s[5]) : true },
    { s in s.take(6).filter({ $0 }).count == 3 },
    { s in [s[10], s[11]].filter({ $0 }).count == 2 },
    { s in [s[6], s[7], s[8]].filter({ $0 }).count == 1 },
    { s in s.take(11).filter({ $0 }).count == 4 }
]

for variant in 0..<(1<<statements.count) {
    let attempt = variant.binaryRepresentationOfLenght(statements.count).map { $0 == 1 }
    
    if statements.map({ $0(attempt) }) == attempt {
        let trueAre = attempt.zipWithIndex().filter { $0.0 }.map { $0.1 + 1 }
        println("Solution found! True are: \(trueAre)")
    }
}
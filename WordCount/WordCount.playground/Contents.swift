
// Author :: JL Garofalo
// Date   :: 05/11/2016
// Purpose:: To determine the word used most frequency in a txt file

// MARK: - Imports
import UIKit

// MARK: - Calculation Functions
/* Function: Calculates the word count in a given file */
func calculateWordCounts(fileName: String, fileType: String)->[NSString: Int]{
    // Dictionary to hold word counts
    var wordCount = [NSString:Int]()
    
    // Get file path and file contents
    if let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType){
        if let contentData = NSFileManager.defaultManager().contentsAtPath(filePath){
            if let content = NSString(data: contentData, encoding: NSUTF8StringEncoding) {
                
                // First separate on space
                let macBeth = content.componentsSeparatedByString(" ")
                for i in macBeth {
                    if(i.containsString("\n")){
                        // Then separate on newline character if necessary
                        let newWords = i.componentsSeparatedByString("\n")
                        for j in newWords {
                           updateWordCount(&wordCount, word: j)
                        }
                    } else {
                        updateWordCount(&wordCount, word: i)
                    }
                }

            }
        }
    }
    
    // Return final word count dictionary
    return wordCount
}

/* Function: Update wordCount dictionary based on given word */
func updateWordCount(inout wordCount: [NSString:Int], word: NSString){
    // Create a character set for any characters that aren't alphanumeric
    let illegalCharSet = NSCharacterSet.alphanumericCharacterSet().invertedSet
    // Remove illegal characters from the word
    let lcWord = word.lowercaseString.componentsSeparatedByCharactersInSet(illegalCharSet).joinWithSeparator("")
    
    // If word already exists, increment count
    if(wordCount.keys.contains(lcWord)){
        wordCount.updateValue((wordCount[lcWord]! + 1), forKey: lcWord)
    // If word does not already exist, add it with an inital count of 1
    } else {
        wordCount[lcWord] = 1
    }
}

// MARK: - Main/Test Execution

// 1. Calculate word counts from input file
let macbethWC = calculateWordCounts("macbeth", fileType: "txt")

// 2. Get sorted word count values to determine min/max
let max = macbethWC.maxElement { (first, second) -> Bool in
    return first.1 < second.1
}

// 3. Print maximum word used
if let foundMax = max {
    print("Macbeth Word Count Final Score")
    print("1st Place (maximum frequency) goes to... ")
    print("- Word: '\(foundMax.0)'")
    print("- Frequency: \(foundMax.1)")
}


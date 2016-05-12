# WordCount
Authored by JL Garofalo (copyright 2016)

## Purpose
This Swift Playground code reads from a text file in its resource directory and calculates frequency of each alphanumeric word in the file. 
It then calculates and reports the most frequently used word.

## Functions
### calculateWordCounts
    /* Function: Calculates the word count in a given file */
    func calculateWordCounts(fileName: String, fileType: String)->[NSString: Int]{...
    
### updateWordCount
    /* Function: Update wordCount dictionary based on given word */
    func updateWordCount(inout wordCount: [NSString:Int], word: NSString){...

## Testing
Included in this playground is a test file "macbeth.txt", although any txt file can be added by dragging it into the navigator panel in the Playground environment.

//
//  ViewController.m
//  Word Processor
//
//  Created by Ryan on 6/16/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *sentencesLabel;
@property (weak, nonatomic) IBOutlet UILabel *vowelsLabel;
@property (weak, nonatomic) IBOutlet UILabel *charactersLabel;

@end

@implementation ViewController

// Right before the view appears, do this
- (void) viewWillAppear:(BOOL)animated {
    [self.textView becomeFirstResponder];
    [self updateStatLabels];
}

// Update all statistics and their labels
- (void) updateStatLabels {
    [self updateSentencesCountLabel];
    [self updateVowelsCountLabel];
    [self updateCharacterCountLabel];
}

- (void) updateSentencesCountLabel {
    self.sentencesLabel.text = [NSString stringWithFormat: @"There are %d sentences", [self countSentencesInString: self.textView.text]];
}

- (void) updateVowelsCountLabel {
    self.vowelsLabel.text = [NSString stringWithFormat: @"There are %d vowels", [self countOfVowelsInString: self.textView.text]];
}

- (void) updateCharacterCountLabel {
    int count = (int) self.textView.text.length;
    self.charactersLabel.text = [NSString stringWithFormat: @"There are %d characters", count];
}

// Count a specific character in a string
- (int) countCharacter:(unichar) character InString:(NSString *) string {
    int count = 0;
    
    // Iterate over the string, and count just that character
    for (int index = 0; index < string.length; index++) {
        if (character == [string characterAtIndex:index]) {
            count++;
        }
    }
    return count;
}

// Count a specific character in a string
// And if previous character was a '.' and the current character is a '.', don't count
- (int) countSentencesInString:(NSString *) string {
    
    // Set default values
    int count = 0;
    unichar previousCharacter = ' ';
    
    // Iterate over the string, count the periods only if another period didn't proceed it
    for (int index = 0; index < string.length; index++) {
        if ('.' == [string characterAtIndex:index]) {
            if (previousCharacter != '.'){
                count++;
            }
        }
        previousCharacter = [string characterAtIndex:index];
    }
    return count;
}


// Count all vowels in a string
- (int) countOfVowelsInString:(NSString *) string {
    
    // For every vowel, count the number of times it occurs in the given string
    int count = 0;
    count = count + [self countCharacter:(unichar) 'A' InString:string];
    count = count + [self countCharacter:(unichar) 'a' InString:string];
    count = count + [self countCharacter:(unichar) 'E' InString:string];
    count = count + [self countCharacter:(unichar) 'e' InString:string];
    count = count + [self countCharacter:(unichar) 'I' InString:string];
    count = count + [self countCharacter:(unichar) 'i' InString:string];
    count = count + [self countCharacter:(unichar) 'O' InString:string];
    count = count + [self countCharacter:(unichar) 'o' InString:string];
    count = count + [self countCharacter:(unichar) 'U' InString:string];
    count = count + [self countCharacter:(unichar) 'u' InString:string];
    return count;
    
//    NSArray *vowels = @[@'A',@'a',@'E',@'e',@'I',@'i',@'O',@'o',@'U',@'u'];
//    int count = 0;
//    for (int index = 0; index < vowels.count; index++) {
//        NSLog(@"%@", vowels[index]);
//        count = count + [self countCharacter:(unichar) vowels[index] InString:string];
//    }
//    return count;
    
}

- (IBAction)showStatButton:(id)sender {
    [self updateStatLabels];
}

@end

//
//  main.m
//  BIO2008Q2
//
//  Created by Jono Muller on 30/11/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rotor.h"

rotor *rotor1;
rotor *rotor2;

NSString *getLetter(NSUInteger position)
{
    NSString *output;
    switch (position) {
        case 0:
            output = @"A";
            break;
        case 1:
            output = @"B";
            break;
        case 2:
            output = @"C";
            break;
        case 3:
            output = @"D";
            break;
        default:
            break;
    }
    return output;
}

NSString *reflect(char letter)
{
    switch (letter) {
        case 'A':
            letter =  'D';
            break;
        case 'D':
            letter = 'A';
            break;
        case 'B':
            letter = 'C';
            break;
        case 'C':
            letter = 'B';
            break;
        default:
            break;
    }
    NSString *reflectedLetter = [NSString stringWithUTF8String:&letter];
    return reflectedLetter;
}

NSMutableString *encryptWord(NSString *word, int turns)
{
    NSMutableString *encryptedWord = [[NSMutableString alloc] init];
    for (int i = 0; i < [word length]; i++) {
        const char letterRotor1 = *[[rotor1 getPosition:[word characterAtIndex:i]] UTF8String];
        const char letterRotor2 = *[[rotor2 getPosition:letterRotor1] UTF8String];
        NSUInteger reflectedLetterRotor2 = [[rotor2 left] indexOfObject:reflect(letterRotor2)];
        NSString *reflectedLetterRotor1 = getLetter(reflectedLetterRotor2);
        NSString *encryptedLetter = getLetter([[rotor1 left] indexOfObject:reflectedLetterRotor1]);
        [encryptedWord appendString:encryptedLetter];
        [rotor1 turn];
        if ((i+1+turns) % 4 == 0) {
            [rotor2 turn];
        }
    }
    NSLog(@"%@", encryptedWord);
    return encryptedWord;
}

void initialTurn(int turns)
{
    for (int i = 1; i <= turns; i++) {
        [rotor1 turn];
        if (i % 4 == 0) {
            [rotor2 turn];
        }
    }
    NSLog(@"rotor1: %@", [rotor1 left]);
    NSLog(@"rotor2: %@", [rotor2 left]);
}

void initialise()
{
    int inputNum = 0;
    char inputString[10];
    scanf("%d", &inputNum);
    scanf("%s", inputString);
    NSString *word = [NSString stringWithUTF8String:inputString];
    rotor1 = [[rotor alloc] init];
    rotor2 = [[rotor alloc] init];
    [rotor1 setLeft:[NSMutableArray arrayWithObjects:@"A", @"D", @"B", @"C", nil]];
    [rotor2 setLeft:[NSMutableArray arrayWithObjects:@"A", @"C", @"B", @"D", nil]];
    initialTurn(inputNum);
    encryptWord(word, inputNum);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}


//
//  main.m
//  BIO2009Q1
//
//  Created by Jono Muller on 03/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray *numbers;

void checkIfNumber(NSString *word, int position)
{
    NSMutableString *newWord = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < [[numbers objectAtIndex:i] length]; j++) {
            for (int n = position; n < [word length]; n++) {
                
                if ([[[numbers objectAtIndex:i] substringWithRange:NSMakeRange(j, 1)] isEqualToString:[word substringWithRange:NSMakeRange(n, 1)]]) {
                    
                    [newWord appendString:[word substringWithRange:NSMakeRange(n, 1)]];
//                    NSLog(@"i=%d, j=%d, n=%d, %@", i, j, n, newWord);
                    
                    if ([newWord isEqualToString:[numbers objectAtIndex:i]]) {
                        NSLog(@"%d", i+1);
                        exit(0);
                    }
                    break;
                }
            }
        }
        [newWord setString:@""];
    }
    
    NSLog(@"NO");
    
}

void initialise()
{
    char input[15];
    scanf("%s", input);
    NSString *word = [NSString stringWithUTF8String:input];
    numbers = [NSMutableArray arrayWithObjects:@"ONE", @"TWO", @"THREE", @"FOUR", @"FIVE", @"SIX", @"SEVEN", @"EIGHT", @"NINE", nil];
    checkIfNumber(word, 0);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}


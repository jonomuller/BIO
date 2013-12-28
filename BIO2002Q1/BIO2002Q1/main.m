//
//  main.m
//  BIO2002Q1
//
//  Created by Jono Muller on 12/12/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray *lojban;

NSString *work(NSString *inputString)
{
    NSMutableString *outputString = [[NSMutableString alloc] init];
    for (int i = 0; i < [inputString length]; i+=2) {
        int number = (int)[lojban indexOfObject:[inputString substringWithRange:NSMakeRange(i, 2)]];
        [outputString appendString:[NSString stringWithFormat:@"%d", number]];
    }
    return outputString;
}

void initialise()
{
    char input[10000];
    scanf("%s", input);
    lojban = [NSMutableArray arrayWithObjects:@"no", @"pa", @"re", @"ci", @"vo", @"mu", @"xa", @"ze", @"bi", @"so", nil];
    NSString *inputString = [NSString stringWithUTF8String:input];
    NSLog(@"%@", work(inputString));
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        initialise();
        
    }
    return 0;
}


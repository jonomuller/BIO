//
//  main.m
//  BIO2000Q1
//
//  Created by Jono Muller on 04/09/2013.
//  Copyright (c) 2013 Jono Muller. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        char input[10];
        
        NSLog(@"Password: ");
        scanf("%s", input);
        
        NSString *password = [NSString stringWithUTF8String:input];
        
        if ([password length] == 1) {
            NSLog(@"Accepted");
            exit(0);
        }
    
        for (int n = 1; n <= ([password length]/2); n++) {
            
            for (int i = 0; i < ([password length] - 2*n + 1); i++) {
                
                if ([[password substringWithRange:NSMakeRange(i, n)] isEqualToString:[password substringWithRange:NSMakeRange(i+n, n)]]) {
                    NSLog(@"Rejected");
                    exit(0);
                }
            }
            
            if (n == ([password length] / 2)) {
                NSLog(@"Accepted");
            }
        }
    }
    return 0;
}
//
//  ModalClass.m
//  SampleCode
//
//  Created by tcs on 12/7/12.
//  Copyright (c) 2012 tcs. All rights reserved.
//

#import "Interpreter.h"

@implementation Interpreter

-(NSString*)parseString:(NSString*)input
{
    NSArray *array=[input componentsSeparatedByString:@"\n"];
    
    NSMutableArray *arrayOfDictionary=[NSMutableArray array];
    NSMutableString *result=[NSMutableString string];
    for (NSString *comp in array) {
        if([comp isEqualToString:@"["])
        {
            if([arrayOfDictionary count]==0)
            {
                [arrayOfDictionary addObject:[NSMutableDictionary dictionary]];
            }
            else{
                [arrayOfDictionary addObject:[[arrayOfDictionary lastObject] mutableCopy]];
            }
        }
        else if([comp isEqualToString:@"]"])
        {
            [arrayOfDictionary removeLastObject];
        }
        else
        {
            NSArray *arrayKeyVal=[comp componentsSeparatedByString:@" "];
            if([arrayKeyVal count]==2)
            {
                if([[arrayKeyVal objectAtIndex:0] isEqualToString:@"print"])
                {
                    if([[arrayOfDictionary lastObject] objectForKey:[arrayKeyVal objectAtIndex:1]]!=nil)
                    {
                        [result appendString:[[arrayOfDictionary lastObject] objectForKey:[arrayKeyVal objectAtIndex:1]]];
                        [result appendString:@"\n"];
                    }
                    else{
                        [result appendString:@"0"];
                        [result appendString:@"\n"];
                    }
                }
                else
                {
                    [[arrayOfDictionary lastObject] setObject:[arrayKeyVal objectAtIndex:1] forKey:[arrayKeyVal objectAtIndex:0]];
                }
            }
        }
    }
    return result;
}
@end
